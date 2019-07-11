# public-bash-utils


### How to use

```bash

#!/usr/bin/env bash

set -e;

name='entity-tools'

(
   curl 'https://raw.githubusercontent.com/oresoftware/public-bash-utils/master/install.sh' | bash
) &

source "$HOME/.oresoftware/bash/public-bash-utils.sh"

docker run -d -p '80:8080' --name "$name" "$name"

docker logs -f "$name" 2> >(tailing 'stderr') 1> >(tailing 'stdout')

```

if you are on bash version 4+, you can use:


```bash
source <(curl 'https://raw.githubusercontent.com/oresoftware/public-bash-utils/master/install.sh')
```
