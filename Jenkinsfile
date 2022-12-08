pipeline {
    agent any

    stages {
        stage('Deploy HTML application') {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'apache', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '/var/www/html', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*.html')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}
