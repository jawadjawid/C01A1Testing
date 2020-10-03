*** Settings ***
Library           Collections
Library           RequestsLibrary
Library           OperatingSystem
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

# /api/v1/computeBaconPath Tests Begin
TestComputeBaconPathWithKevinBaconWithoutMovieButWithNonExistingActorId
    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json
        ${params}=    Create Dictionary    name=Kevin Bacon    actorId=nm0000102
        ${resp}=    Put Request    localhost    /api/v1/addActor    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    200

    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
        ${params}=    Get Binary File    j2.json
        ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    400

TestComputeBaconPathWithKevinBaconWithExistingActorIdNoPath
    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
        ${params}=    Get Binary File    j3.json
        ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    404

TestComputeBaconPathForKevinBaconHasNoMovie
    Create Session    localhost    http://localhost:8080
        ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
        ${params}=    Get Binary File    j5.json
        ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
        Should Be Equal As Strings    ${resp.status_code}    400

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
          ${params}=    Get Binary File    j4.json
          ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
          Should Be Equal As Strings    ${resp.status_code}    200

          ${expectedJSON}=  To Json  {"baconPath":[{"actorId":"nm0000102","movieId":"tt2"},{"actorId":"nm2","movieId":"tt2"}],"baconNumber":1}  pretty_print=True
          ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
          &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
          &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
          Dictionaries Should Be Equal    ${expected}   ${actual}

TestComputeBaconPathWithKevinBaconWithExistingActorIdMultiplePaths
    Create Session    localhost    http://localhost:8080
            ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
            ${params}=    Get Binary File    j5.json
            ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
            Should Be Equal As Strings    ${resp.status_code}    200

            ${expectedJSON}=  Get Binary File  expectedJson1.json
            ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
            &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
            &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
            Dictionaries Should Be Equal    ${expected}   ${actual}

TestComputeBaconPathForKevinBaconHasMovie
    Create Session    localhost    http://localhost:8080
            ${headers}=    Create Dictionary    Content-Type=application/json; charset=utf-8
            ${params}=    Get Binary File    j6.json
            ${resp}=    Get Request    localhost    /api/v1/computeBaconPath    data=${params}    headers=${headers}
            Should Be Equal As Strings    ${resp.status_code}    200

            ${expectedJSON}=  To Json  {"baconPath":[{"actorId":"nm0000102","movieId":"tt2"}],"baconNumber":"0"}  pretty_print=True
            ${actualJSON}=  To Json  ${resp.content}  pretty_print=True
            &{actual}=  Evaluate  json.loads('''${actualJSON}''')  json
            &{expected}=  Evaluate  json.loads('''${expectedJSON}''')  json
            Dictionaries Should Be Equal    ${expected}   ${actual}



