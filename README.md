Spree Enhanced Banner
==============
Spree Enhanced Banner, is an extension for spree e-commerce platform. It provides spree's frontend with a way to associate banners with taxons, and dinamically change them through a configuration on the admin view on the backend.

###Important Note
The Spree Enhanced Banner project is a work in progress, and will suffer major changes. Please use it and keep a live feedback with the team by opening a [GitHub issue](https://github.com/openjaf/spree_enhanced_banner/issues/new).

Requirements
------------
### Rails and Spree
Spree Enhanced Banner now requires Rails version **>= 4.0** and a Spree version **>=2.1**.

Installation
------------

Spree Enhanced Banner is not yet distributed as a gem, so it should be used in your app with a git reference or you can download the source and build the gem on your own.

1. Add the following to your Gemfile

  ```ruby
    gem 'spree_enhanced_banner’, :git => 'https://github.com/openjaf/spree_enhanced_banner.git', :branch => 'master'
  ```

2. Run `bundle install`

3. To copy and apply migrations run:

  ```
  rails g spree_enhanced_banner:install
  ```

Features
------------

- Adds a banner to the store's frontend.
- Allows to associate a group of banners to a taxon.
- Adds a configuration view an the backend with items to dinamically select wich banner to show, related to a taxon.
- Shows a map with the location of the related products, and a list beneath with links to those related.


How to use it
------------

After installing the extensions go to **admin/configuration** and from the navigation bar on the right select the item for the banners configuration. Adjust the settings for your taxons, and add banners for each category, the banner will be placed on the top of the store view.

![Banner on Store](/readme_images/banner_view.jpg?raw=true "Banner on Store")


Contributing
------------

If you'd like to contribute a feature or bugfix: Thanks! To make sure your
fix/feature has a high chance of being included, please read the following
guidelines:

1. Post a [pull request](https://github.com/openjaf/spree_enhanced_banner/compare/).
2. Or open a [GitHub issue](https://github.com/openjaf/spree_enhanced_banner/issues/new).

License
-------

Spree Enhanced Banner is Copyright © 2014 openjaf. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.
