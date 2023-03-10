import ballerina/graphql;

@display {
	label: "newGraphQL",
	id: "newGraphQL-66cb0900-ccef-4659-b47c-769e6e14c2bf"
}
service / on new graphql:Listener(9090) {

    // A resource method with `get` accessor inside a `graphql:Service` represents a field in the
    // root `Query` type.
    resource function get greeting() returns string {
        return "Hello, World";
    }
}
