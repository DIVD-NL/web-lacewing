module Lacewing
  class PartnerPageGenerator < Jekyll::Generator
    safe true
    priority :normal

    def generate(site)
      collection = site.collections['partners']
      return unless collection

      collection.docs.each do |doc|
        slug = File.basename(doc.path, '.*')
        site.pages << build_page(site, doc, slug)
      end
    end

    private

    def build_page(site, doc, slug)
      page = Jekyll::PageWithoutAFile.new(site, site.source, "partner/#{slug}", 'index.html')
      page.data.merge!(
        'layout'       => 'partner',
        'lang'         => 'en',
        'title'        => doc.data['name'],
        'name'         => doc.data['name'],
        'website'      => doc.data['website'],
        'logo'         => doc.data['logo'],
        'founded'      => doc.data['founded'],
        'description'  => doc.data['description'],
        'contribution' => doc.data['contribution'],
        'slug'         => slug,
      )
      page.content = doc.content
      page
    end
  end
end
