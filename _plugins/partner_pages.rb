module Lacewing
  class PartnerPageGenerator < Jekyll::Generator
    safe true
    priority :normal

    def generate(site)
      collection = site.collections['partners']
      return unless collection

      collection.docs.each do |doc|
        slug = File.basename(doc.path, '.*')

        site.pages << build_page(site, doc, 'nl', "partner/#{slug}", "/en/partner/#{slug}/")
        site.pages << build_page(site, doc, 'en', "en/partner/#{slug}", "/partner/#{slug}/")
      end
    end

    private

    def build_page(site, doc, lang, dir, alt_url)
      page = Jekyll::PageWithoutAFile.new(site, site.source, dir, 'index.html')
      page.data.merge!(
        'layout'       => 'partner',
        'lang'         => lang,
        'title'        => doc.data['name'],
        'name'         => doc.data['name'],
        'website'      => doc.data['website'],
        'logo'         => doc.data['logo'],
        'founded'      => doc.data['founded'],
        'nl'           => doc.data['nl'],
        'en'           => doc.data['en'],
        'slug'         => File.basename(doc.path, '.*'),
        'lang_alt_url' => alt_url,
      )
      page.content = doc.content
      page
    end
  end
end
