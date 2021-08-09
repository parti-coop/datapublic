require 'csv'

namespace :sewol do
  task :fetch => :environment do
    user = User.find_by(name: 'jay')

    ActiveRecord::Base.transaction do
      archive = Archive.create!(title: "세월호 아카이브", body: "세월호 아카이브", 
        user: user, slug: "sewolarchive", publisher: "사회적협동조합 빠띠")

      count = 1
      CSV.foreach('tmp/archive_documents.csv', headers: true) do |row|
        puts "================="
        puts "row: #{row.inspect}"

        dataset = DataSet.create!(
          title: row['title'], body: row['body'],
          user: user, 
          created_at: row['created_at'],
          updated_at: row['updated_at'],
          url: 'https://parti.coop', # TODO 나중에는 RF - 타입에 따른 validation
          archive: archive,
          publisher: row['content_creator'],
        )

        sewoldata = SewolDataDetail.create!(
          content_created_time: row['content_created_time'],
          content_source:	row['content_source'],
          content: row['content'],
          content_name: row['content_name'],
          content_type: row['content_type'],
          content_size: row['content_size'],
          category_slug: row['category_slug'],
          media_type: row['media_type'],
          content_created_date: row['content_created_date'], 
          content_recipients: row['content_recipients'],
          donor: row['donor'],
          is_secret_donor: row['is_secret_donor'], 
          data_set_id: dataset
        )

        # 외부DataDetail
        # NgoDataDetail...........
        print '.'
        puts if count > 80
        count = count + 1
        break if count > 300

        # puts "dataset: #{dataset.inspect}"
        # puts "sewoldatadetail: #{sewoldata.inspect}"
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
