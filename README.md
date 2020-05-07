# SISGEM

The Mobile Equipment Management System (SisGEM in portuguese) arises from a real life demand, related to the loan management, improvement, also return and maintenance of mobile equipment of the Technology, Communication and Education (PTCE in portuguese) Program from the Instituto Federal Fluminense Campus Campos - Centro, RJ.

The project goal is the development of a system, to promotes data reliability and integrity also, providing adequate mobile equipment data storage and management. The research will adopt open source technologies and responsive design, intending compatible device accessibility.

Click [here](http://bd.centro.iff.edu.br/jspui/bitstream/123456789/2384/1/Texto.pdf) to see a full review of the software in portuguese.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development.

### Prerequisites

[Ruby on Rails](https://gorails.com/setup/ubuntu/19.10), [PostgreSQL](https://gorails.com/setup/ubuntu/19.10#database), [Yarn](https://classic.yarnpkg.com/en/docs/install/#debian-stable) and a text editor. I'm using [VSCode](https://code.visualstudio.com/Download) on Ubuntu.

## Installing
cd to the cloned folder. Modify the "/config/database.yml" with your Database credentials
```
$ yarn
$ rails db:setup
```
Go to http://localhost:3000 and the project is up and running!

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - Main Language
* [Rails](https://rubyonrails.org/) - The web framework used
* [Bootstrap](https://getbootstrap.com/docs/3.3/) - FrontEnd framework
* [PostgreSQL](https://www.postgresql.org/) - Database

## Authors

* **Renan Oliveira** - [GitHub](https://github.com/lmaoclost)
* **Edson Aristides** - [GitHub](https://github.com/EdAristides)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details