# Puppet PHP skeleton development environment
This is CONTROL REPO for [Puppet](https://puppet.com/) configuration that allows quickly install all required software for Web-Development of PHP projects.

## Install
```bash
./run.sh
```

#### Provision result
    - PHP 
        - versions 5.6, 7.x
        - pools for projects and sub-projects
        - extensions
        - composer
    - NGINX
        - PHP-FPM upstream
        - Web-Sites
    - OpenSSL
    - MySQL
    - Bind9
    - NodeJS + NPM
    - Memcached
    - Redis
    - Docker

###### Note
 - Current Module is only for Debian-based systems.
 - Projects folder is: /var/www/{project}/
 - Project logs: 
    - /var/log/nginx/{project}_error.log
    - /var/log/nginx/{project}_access.log

###### Dev Notes
- before test vagrant run SSH-AGENT:
```bash
$ eval $(ssh-agent -s)
Agent pid 5984

$ ssh-add ~/.ssh/id_rsa
Identity added: /c/Users/OxCom/.ssh/id_rsa (/c/Users/OxCom/.ssh/id_rsa)
```

or

On windows you have to run Putty Auth Agent
- Install [Vagrant Triggers](https://github.com/emyl/vagrant-triggers)
 

#### Modules
- [APT Module](https://github.com/puppetlabs/puppetlabs-apt)
- [Composer Module](https://github.com/willdurand/puppet-composer)
- [MySQL Module](https://github.com/puppetlabs/puppetlabs-mysql)
- [OpenSSL Module](https://forge.puppet.com/camptocamp/openssl)
- [Docker](https://forge.puppet.com/puppetlabs/docker)

#### Articles: 
- [Puppet Docs](https://docs.puppet.com)
- [R10K - Deployment](https://techpunch.co.uk/development/how-to-build-a-puppet-repo-using-r10k-with-roles-and-profiles)
- [Puppet Modules](https://forge.puppet.com/)
- [Puppet Cookbook](https://www.puppetcookbook.com)

#### Books
- [Mastering Puppet (Thomas Uphill)](https://www.amazon.de/Mastering-Puppet-Second-Thomas-Uphill/dp/1785888102/ref=sr_1_2?ie=UTF8&qid=1502625611&sr=8-2&keywords=Mastering+Puppet)
- [Puppet Cookbook (Thomas Uphill)](https://www.amazon.de/Puppet-Cookbook-Third-Thomas-Uphill/dp/1784394882/ref=sr_1_1?s=books-intl-de&ie=UTF8&qid=1502625688&sr=1-1&keywords=Puppet+Cookbook) 
- [Learning Puppet (Jussi Heinonen)](https://www.amazon.de/Learning-Puppet-Jussi-Heinonen/dp/1784399833/ref=sr_1_1?ie=UTF8&qid=1502627535&sr=8-1&keywords=Learning+Puppet)
- [Pro Puppet(Spencer Krum)](https://www.amazon.de/Pro-Puppet-Second-Professional-Apress/dp/1430260408/ref=sr_1_1?s=books-intl-de&ie=UTF8&qid=1502627648&sr=1-1&keywords=Pro+Puppet)
