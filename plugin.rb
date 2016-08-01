# name: osubeatmap-onebox-plugin
# about: Simple osu! beatmap preview onebox for discourse
# version: 0.0.1
# authors: PhoenixEmik
# url:

Onebox = Onebox

module Onebox
  module Engine
    module OsuBeatmapOnebox
      include Engine
      include LayoutSupport
      include HTML

      matches_regexp(/^(https?:\/\/)?(osu\.ppy\.sh\/)([bs]\/)([\d]*\/?)(&m=[\d])?$/)

      private

      def data
        result = {
          link: link,
          title: raw.css("title").text,
          image: raw.css("img.bmt").first['src'],
          description: raw.css("div.posttext").text
        }
      end
    end
  end
end
