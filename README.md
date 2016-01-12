# Similars

Store undirected graph in SQL with prime factors. This app uses airbnb's
listing recomendations as the sample data.

Some scientists wrote some papers about how store edge data about graphs in prime numbers

<https://www.researchgate.net/publication/220188177_Finding_the_prime_factors_of_strong_direct_product_graphs_in_polynomial_time>

<http://www.sciencedirect.com/science/article/pii/0166218X86900235>

Testing is with minitest, and are run with `rake`.

## Getting Started

1. Install ruby 2.2.2
`rvm install 2.2.2`
2. Get some gems
`bundle install`
3. Setup Postgresql
`createdb similars_development`
`rake db:migrate`
4. Run the tests
`rake`

