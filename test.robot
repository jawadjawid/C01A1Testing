*** Settings ***
Library           Collections
Library           RequestsLibrary
Test Timeout      30 seconds

*** Variables ***
${TestAddActorBadFormat400}   {"name": "James Doe" "actorId": "nm2"}
${TestAddMovieBadFormat400}   {name=The Martin  movieId=tt2}
${TestAddRelationshipBadFormat400}    actorId=nm2   movieId=tt2
${TestGetActorBadFormat400}   {actorId "nm1"}

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

TestAddActorBadFormat400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${TestAddActorBadFormat400}    headers=${headers}
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

TestAddMovieBadFormat400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${TestAddMovieBadFormat400}    headers=${headers}
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

TestAddRelationshipBadFormat400
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${TestAddRelationshipBadFormat400}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestAddNewRelationship200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    actorId=nm2   movieId=tt2
    ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

# /api/v1/getActor Tests Begin
TestGetActor200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"actorId":"nm1","name":"John Doe","movies":["tt2","tt1"]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}          ${actual}

TestGetSameActorAgain200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"actorId":"nm1","name":"John Doe","movies":["tt2","tt1"]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}          ${actual}

TestGetNonExistingActor404
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm3"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    404

TestGetActorWithExtraParameters200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"actorId":"nm1","name":"John Doe","movies":["tt2","tt1"]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}          ${actual}

TestGetActorWithMissingActorId400
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"mamaBurgerId":"nm1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestGetActorWithPutRequest400
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm1"}  pretty_print=True
    ${resp}=    Put Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestGetActorWithBadFormat400
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${TestGetActorBadFormat400}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestGetAnotherActor200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm2"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"name":"James Doe", "actorId":"nm2","movies":["tt2","tt1"]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}          ${actual}

# /api/v1/getActor Tests Begin





