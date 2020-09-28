*** Settings ***
Library           Collections
Library           RequestsLibrary
Test Timeout      90000 seconds


*** Test Cases ***
# /api/v1/addActor Tests Begin

TestAddActor200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=John Doe    actorId=nm1
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

TestAddSameActorAgain400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=John Doe    actorId=nm1
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddActorWithExistingName400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=John Doe    actorId=nm2
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddActorWithExistingId400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=James Doe    actorId=nm1
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddActorWithMissingId400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=James Doe
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddActorWithMissingName400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm2
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddActorWithAGETRequest400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=James Doe    actorId=nm2
    ${resp}=    Get Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddNewActor200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=James Doe    actorId=nm2
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

# /api/v1/addMovie Tests Begin
TestAddMovie200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=The Matrix    movieId=tt1
    ${resp}=    Put Request    localhost    /api/v1/addMovie    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

TestAddSameMovieAgain400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=The Matrix    movieId=tt1
    ${resp}=    Put Request    localhost    /api/v1/addMovie    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddMovieWithExistingName400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=The Matrix    movieId=tt2
    ${resp}=    Put Request    localhost    /api/v1/addMovie    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddMovieWithExistingId400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=The Martin    movieId=tt1
    ${resp}=    Put Request    localhost    /api/v1/addMovie    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddMovieWithMissingName400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    movieId=tt2
    ${resp}=    Put Request    localhost    /api/v1/addMovie    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddMovieWithMissingId400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=The Martin
    ${resp}=    Put Request    localhost    /api/v1/addMovie    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddMovieWithGetRequest400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=The Martin    movieId=tt2
    ${resp}=    Get Request    localhost    /api/v1/addMovie    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddNewMovie200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=The Martin    movieId=tt2
    ${resp}=    Put Request    localhost    /api/v1/addMovie    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

# /api/v1/addRelationship Tests Begin
TestAddRelationship200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm1    movieId=tt1
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

TestAddSameRelationshipAgain400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm1    movieId=tt1
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddRelationshipSameActorWithDiffMovie200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm1    movieId=tt2
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

TestAddRelationshipDiffActorWithSameMovie200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm2    movieId=tt1
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

TestAddRelationshipWithMissingActorId400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    movieId=tt1
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddRelationshipWithMissingMovieId400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm2
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddRelationshipWithNonExistingActorId404
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm3   movieId=tt1
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    404

TestAddRelationshipWithNonExistingMovieId404
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm1   movieId=tt3
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    404

TestAddRelationshipWithGetRequest400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm2   movieId=tt2
    ${resp}=    Get Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddNewRelationship200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm2   movieId=tt2
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

# /api/v1/getActor Tests Begin
TestGetActor200
# idk why this return 400. There's an issue happening where te parmas are being sent as "actorId=nm1 movieId=tt2"
# instead of "{actorId=nm1, movieId=tt2}. That only happens if the request is of type GET
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm1 movieId=tt2
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200
