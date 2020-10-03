*** Settings ***
Library           Collections
Library           RequestsLibrary
Test Timeout      3000 seconds

*** Variables ***
${TestAddActorBadFormat400}   {"name": "James Doe" "actorId": "nm2"}
${TestAddMovieBadFormat400}   {name=The Martin  movieId=tt2}
${TestAddRelationshipBadFormat400}    actorId=nm2   movieId=tt2
${TestGetActorBadFormat400}   {actorId "nm1"}
${TestGetMovieBadFormat400}   {"movieId":}
${TestHasRelationshipBadFormat400}  {"movieId":"tt3""actorId":"nm2"}

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
    Dictionaries Should Be Equal    ${expected}    ${actual}

TestGetSameActorAgain200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"movies":["tt2","tt1"], "actorId":"nm1","name":"John Doe"}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}    ${actual}

TestGetNonExistingActor404
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm3"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    404

TestGetActorWithExtraParameters200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm1", "mamaBurgerId":"nm1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"actorId":"nm1","name":"John Doe","movies":["tt2","tt1"]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}    ${actual}

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
    Dictionaries Should Be Equal    ${expected}    ${actual}

AddActorForGetActor200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=Jacob Doe    actorId=nm3
    ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

TestGetActorWithNoMovies200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"actorId":"nm3"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getActor    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"name":"Jacob Doe", "actorId":"nm3","movies":[]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}    ${actual}

# /api/v1/getMovie Tests Begin

TestGetMovie200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getMovie    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"movieId":"tt1","name":"The Matrix","actors":["nm2","nm1"]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}   ${actual}

TestGetMovieAgain200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getMovie    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"name":"The Matrix", "movieId":"tt1","actors":["nm2","nm1"]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}   ${actual}

TestGetNonExistingMovie404
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt3"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getMovie    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    404

TestGetMovieWithExtraParameters200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt1", "mamaBurgerId":"nm1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getMovie    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"movieId":"tt1","name":"The Matrix","actors":["nm2","nm1"]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}    ${actual}

TestGetActorWithMissingMovieId400
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"mamaBurgerId":"nm1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getMovie    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestGetMovieWithPutRequest400
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt1"}  pretty_print=True
    ${resp}=    Put Request    localhost    /api/v1/getMovie    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestGetMovieWithBadFormat400
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${resp}=    Get Request    localhost    /api/v1/getMovie    data=${TestGetMovieBadFormat400}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestGetAnotherMovie200
    Create Session    localhost    http://localhost:8080
	 ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt2"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getMovie    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"movieId":"tt2","name":"The Martin","actors":["nm2","nm1"]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}    ${actual}

AddMovieForGetMovie200
    Create Session    localhost    http://localhost:8080
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${params}=    Create Dictionary    name=The Maze    movieId=tt3
    ${resp}=    Put Request    localhost    /api/v1/addMovie    data=${params}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

TestGetMovieWithNoActors200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt3"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/getMovie    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"movieId":"tt3","name":"The Maze","actors":[]}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}    ${actual}

# /api/v1/hasRelationship Tests Begin
TestHasRelationship200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt1", "actorId": "nm1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/hasRelationship    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"movieId":"tt1","actorId":"nm1","hasRelationship":true}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}   ${actual}

TestHasNoRelationship200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt1", "actorId": "nm3"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/hasRelationship    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"movieId":"tt1","actorId":"nm3","hasRelationship":false}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}   ${actual}

TestHasRelationshipWithNonExistingActorId404
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
	${inputJSON}=  To Json  {"movieId":"tt1", "actorId": "nm4"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/hasRelationship    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    404

TestHasRelationshipWithNonExistingMovieId404
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
	${inputJSON}=  To Json  {"movieId":"tt4", "actorId": "nm3"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/hasRelationship    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    404

TestHasRelationshipWithMissingMovieId400
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
	${inputJSON}=  To Json  {"actorId": "nm3"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/hasRelationship    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestHasRelationshipWithMissingActorId400
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
	${inputJSON}=  To Json  {"movieId": "tt1"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/hasRelationship    data=${inputJSON}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestHasRelationshipWithBadFormat400
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${resp}=    Get Request    localhost    /api/v1/getMovie    data=${TestHasRelationshipBadFormat400}   headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    400

TestHasNoRelationshipAgain200
    Create Session    localhost    http://localhost:8080
	${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${inputJSON}=  To Json  {"movieId":"tt3", "actorId": "nm2"}  pretty_print=True
    ${resp}=    Get Request    localhost    /api/v1/hasRelationship    data=${inputJSON}   headers=${headers}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"movieId":"tt3","actorId":"nm2","hasRelationship":false}  pretty_print=True
    ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
    &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
    &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
    Dictionaries Should Be Equal    ${expected}   ${actual}

# /api/v1/computeBaconPath and /api/v1/computeBaconNumber Tests Begin
TestComputeBaconPathWithKevinBaconWithoutMovieButWithNonExistingActorId
    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json
        ${params}=    Create Dictionary    name=Kevin Bacon    actorId=nm0000102
        ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    200

    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json
        ${params}=    Create Dictionary    name=sdfsdf    actorId=hkjh
        ${resp}=    Get Request    localhost    /api/v1/computeBaconNumber    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    400

TestComputeBaconNumberWithKevinBaconWithoutMovieButWithNonExistingActorId
    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
        ${params}=    Create Dictionary   actorId=hehehe
        ${resp}=    Get Request    localhost    /api/v1/computeBaconNumber    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    400

TestComputeBaconPathWithKevinBaconWithExistingActorIdNoPath
    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
        ${params}=    To Json   {"actorId":"nm2"}     pretty_print=True
        ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    404

TestComputeBaconNumberWithKevinBaconWithExistingActorIdNoPath
    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
        ${params}=    To Json   {"actorId":"nm2"}     pretty_print=True
        ${resp}=    Get Request    localhost    /api/v1/computeBaconNumber    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    404

TestComputeBaconPathForKevinBaconHasNoMovie
    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
        ${params}=    To Json   {"actorId":"nm0000102"}     pretty_print=True
        ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    400

TestComputeBaconNumberForKevinBaconHasNoMovie
    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
        ${params}=    To Json   {"actorId":"nm0000102"}     pretty_print=True
        ${resp}=    Get Request    localhost    /api/v1/computeBaconNumber    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    200

    ${expectedJSON}=  To Json  {"baconNumber":"0"}  pretty_print=True
              ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
              &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
              &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
              Dictionaries Should Be Equal    ${expected}   ${actual}

TestComputeBaconPathWithKevinBaconWithExistingActorIdOnePath
      Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json
        ${params}=    Create Dictionary    actorId=nm0000102   movieId=tt2
        ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    200

     Create Session    localhost    http://localhost:8080
         ${headers}=    Create Dictionary    Content-Type=application/json
         ${params}=    Create Dictionary    name=Billy    actorId=bill321
         ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
         Should Be Equal As Strings    ${resp.status_code}    200

     Create Session    localhost    http://localhost:8080
         ${headers}=    Create Dictionary    Content-Type=application/json
         ${params}=    Create Dictionary    actorId=bill321   movieId=tt1
         ${resp}=    Put Request    localhost    /api/v1/addRelationship    data=${params}    headers=${headers}
         Should Be Equal As Strings    ${resp.status_code}    200

    Create Session    localhost    http://localhost:8080
          ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
          ${params}=    To Json      {"actorId":"nm2"}   pretty_print=True
          ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
          Should Be Equal As Strings    ${resp.status_code}    200

          ${expectedJSON}=  To Json  {"baconPath":[{"actorId":"nm0000102","movieId":"tt2"},{"actorId":"nm2","movieId":"tt2"}],"baconNumber":"1"}  pretty_print=True
          ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
          &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
          &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
          Dictionaries Should Be Equal    ${expected}   ${actual}

TestComputeBaconNumberWithKevinBaconWithExistingActorIdOnePath
      Create Session    localhost    http://localhost:8080
            ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
            ${params}=   To Json    {"actorId":"nm2"}   pretty_print=True
            ${resp}=    Get Request    localhost    /api/v1/computeBaconNumber    data=${params}    headers=${headers}
            Should Be Equal As Strings    ${resp.status_code}    200

            ${expectedJSON}=  To Json  {"baconNumber":"1"}  pretty_print=True
            ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
            &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
            &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
            Dictionaries Should Be Equal    ${expected}   ${actual}

TestComputeBaconPathWithKevinBaconWithExistingActorIdMultiplePaths
    Create Session    localhost    http://localhost:8080
            ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
            ${params}=    To Json   {"actorId":"bill321"}   pretty_print=True
            ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
            Should Be Equal As Strings    ${resp.status_code}    200

            ${expectedJSON}=  To Json  {"baconPath":[{"actorId":"nm0000102","movieId":"tt2"},{"actorId":"nm2","movieId":"tt2"},{"actorId":"nm2","movieId":"tt1"},{"actorId":"bill321","movieId":"tt1"}],"baconNumber":"2"}   pretty_print=True
            ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
            &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
            &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
            Dictionaries Should Be Equal    ${expected}   ${actual}

TestComputeBaconNumberWithKevinBaconWithExistingActorIdMultiplePaths
    Create Session    localhost    http://localhost:8080
            ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
            ${params}=    To Json    {"actorId":"bill321"}   pretty_print=True
            ${resp}=    Get Request    localhost    /api/v1/computeBaconNumber    data=${params}    headers=${headers}
            Should Be Equal As Strings    ${resp.status_code}    200

            ${expectedJSON}=  To Json  {"baconNumber":"2"}  pretty_print=True
            ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
            &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
            &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
            Dictionaries Should Be Equal    ${expected}   ${actual}

TestComputeBaconPathForKevinBaconHasMovie
    Create Session    localhost    http://localhost:8080
            ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
            ${params}=    To Json    {"actorId":"nm0000102"}   pretty_print=True
            ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
            Should Be Equal As Strings    ${resp.status_code}    200

            ${expectedJSON}=  To Json  {"baconPath":[{"actorId":"nm0000102","movieId":"tt2"}],"baconNumber":"0"}  pretty_print=True
            ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
            &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
            &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
            Dictionaries Should Be Equal    ${expected}   ${actual}



