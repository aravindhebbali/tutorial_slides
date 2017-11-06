library(xml2)
library(purrr)
library(tibble)
library(stringr)

# cd example

cd <- read_xml('J:/R/tutorial_slides/data-wrangling/import/cd.xml')
xml_name(cd)
xml_children(cd)
xml_child(cd)
xml2::xml_contents(cd)
xml_find_all(cd, './/TITLE')
xml2::xml_structure(cd)
xml2::xml_length(cd)
xml2::xml_root(cd)

# all titles
xml_find_all(cd, './/TITLE') %>%
  xml_text(cd)

# all artists
xml_find_all(cd, './/ARTIST') %>%
  xml_text(cd)

# all release years
xml_find_all(cd, './/YEAR') %>%
  xml_integer()

# all price
xml_find_all(cd, './/PRICE') %>%
  xml_double()

cds <- tibble::tibble(
  title = xml_find_all(cd, './/TITLE') %>% xml_text(),
  artist = xml_find_all(cd, './/ARTIST') %>% xml_text(),
  year = xml_find_all(cd, './/YEAR') %>% xml_integer(),
  price = xml_find_all(cd, './/PRICE') %>% xml_double()
)

# books example
# read xml
books <- read_xml('J:/R/tutorial_slides/data-wrangling/import/sample_xml.xml')

# explore
xml_name(books)
xml_children(books)
xml_child(books)
xml2::xml_contents(books)
xml_find_all(books, './/TITLE')
xml2::xml_structure(books)
xml2::xml_length(books)
xml2::xml_root(books)

xml_find_all(books, './/book') %>% 
  map_chr(xml_attrs)

# author
xml_find_all(books, './/author') %>%
  xml_text()

# title
xml_find_all(books, './/title') %>%
  xml_text()

# genre
xml_find_all(books, './/genre') %>%
  xml_text()

# price
xml_find_all(books, './/price') %>%
  xml_double()

# published
xml_find_all(books, './/publish_date') %>%
  xml_text()

# description
# title
xml_find_all(books, './/description') %>%
  xml_text() %>%
  stringr::str_replace_all("[\n]", "") %>%
  stringr::str_replace_all(pattern = "      ", " ") %>%
  stringr::str_replace_all(pattern = "  ", " ")

book <- tibble::tibble(
  author = xml_find_all(books, './/author') %>%
    xml_text(),
  title = xml_find_all(books, './/title') %>%
    xml_text(),
  genre = xml_find_all(books, './/genre') %>%
    xml_text(),
  price = xml_find_all(books, './/price') %>%
    xml_double(),
  published = xml_find_all(books, './/publish_date') %>%
    xml_text(),
  description = xml_find_all(books, './/description') %>%
    xml_text() %>%
    stringr::str_replace_all("[\r\n]", "") %>%
    stringr::str_replace_all(pattern = "      ", " ") %>%
    stringr::str_replace_all(pattern = "  ", " ")
)
