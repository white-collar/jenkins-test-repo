def buildApp() {
    echo "Buiding app"
}

def deployApp() {
    echo "Deploying app"
}


def testApp() {
    echo "Testinging app ${params.VERSION}"
}
return this