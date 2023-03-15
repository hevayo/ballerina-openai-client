import ballerina/url;
import ballerina/mime;

type SimpleBasicType string|boolean|int|float|decimal;

# Represents encoding mechanism details.
type Encoding record {
    # Defines how multiple values are delimited
    string style = FORM;
    # Specifies whether arrays and objects should generate as separate fields
    boolean explode = true;
    # Specifies the custom content type
    string contentType?;
    # Specifies the custom headers
    map<any> headers?;
};

enum EncodingStyle {
    DEEPOBJECT, FORM, SPACEDELIMITED, PIPEDELIMITED
}

# Get Encoded URI for a given value.
#
# + value - Value to be encoded
# + return - Encoded string
isolated function getEncodedUri(anydata value) returns string {
    string|error encoded = url:encode(value.toString(), "UTF8");
    if (encoded is string) {
        return encoded;
    } else {
        return value.toString();
    }
}

isolated function createBodyParts(record {|anydata...;|} anyRecord, map<Encoding> encodingMap = {}) returns mime:Entity[]|error {
    mime:Entity[] entities = [];
    foreach [string, anydata] [key, value] in anyRecord.entries() {
        Encoding encodingData = encodingMap.hasKey(key) ? encodingMap.get(key) : {};
        mime:Entity entity = new mime:Entity();
        if value is record {byte[] fileContent; string fileName;} {
            entity.setContentDisposition(mime:getContentDispositionObject(string `form-data; name=${key};  filename=${value.fileName}`));
            entity.setByteArray(value.fileContent);
        } else if value is byte[] {
            entity.setContentDisposition(mime:getContentDispositionObject(string `form-data; name=${key};`));
            entity.setByteArray(value);
        } else if value is SimpleBasicType|SimpleBasicType[] {
            entity.setContentDisposition(mime:getContentDispositionObject(string `form-data; name=${key};`));
            entity.setText(value.toString());
        } else if value is record {}|record {}[] {
            entity.setContentDisposition(mime:getContentDispositionObject(string `form-data; name=${key};`));
            entity.setJson(value.toJson());
        }
        if (encodingData?.contentType is string) {
            check entity.setContentType(encodingData?.contentType.toString());
        }
        map<any>? headers = encodingData?.headers;
        if (headers is map<any>) {
            foreach var [headerName, headerValue] in headers.entries() {
                if headerValue is SimpleBasicType {
                    entity.setHeader(headerName, headerValue.toString());
                }
            }
        }
        entities.push(entity);
    }
    return entities;
}
