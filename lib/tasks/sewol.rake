require 'csv'

namespace :sewol do
  task :fetch => :environment do
    user = User.find_by(name: 'jay')

    ActiveRecord::Base.transaction do
      archive = Archive.create!(title: "세월호 아카이브", body: "세월호 아카이브", 
        user: user, slug: "sewolarchive", publisher: "사회적협동조합 빠띠")

      CSV.foreach('tmp/archive_documents.csv', headers: true) do |row|
        puts "================="
        puts "row: #{row.inspect}"
# <CSV::Row "comments_count":"0" "likes_count":"0" "content_created_time":"8:52" "content_source":"소방방재청" "content":"ac34273725.wav" "content_name":"08시52분_119소방_학생_익명.wav" "content_type":"audio/x-wav" "content_size":"3081990" "created_at":"2017-02-22 23:19:49 +0900" "updated_at":"2017-02-22 23:19:49 +0900" "category_slug":"voices-victim" "media_type":"음성" "content_created_date":"20140416" "content_recipients":nil "donor":"국회 세월호 국정조사 특위" "is_secret_donor":"false" "tag_list":nil
        
        dataset = DataSet.new(
          title: row['title'], body: row['body'],
          user: user, 
          created_at: row['created_at'],
          updated_at: row['updated_at'],
          url: 'https://parti.coop', # TODO 나중에는 RF - 타입에 따른 validation
          archive: archive,
          publisher: row['content_creator'],
        )

        SewolDataDetail

        # 외부DataDetail
        # NgoDataDetail...........

        puts "dataset: #{dataset.inspect}"
        raise "OK!"
      end
    end
  end
end

# SewolSource
# "publisher" <= ArchiveDocument#"content_creator" ex) 소방방재청
# "file_type"=> ExeternalSource
# "properties”=> ExeternalSource
# "data_created_at"<= ArchiveDocument#"content_created_time"
# "data_updated_at"???
# "license"
# "memo"
# "tag_list"


# --
# "donor":"국회 세월호 국정조사 특위
