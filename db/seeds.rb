# User.create!(
#     [
#      {
#         id: '1',
#         email: 'test1@test.com',
#         encrypted_password: '111111',
#         first_name: '吉崎',
#         last_name: '泰雅',
#         first_name_ruby: 'ヨシザキ',
#         last_name_ruby: 'タイガ',
#         phone_number: '111-1111-1111',
#         zip_code: '111-1111',
#         address: '神奈川県海老名市上郷1-1-1'
#      },
#      {
#         id: '2',
#         email: 'test2@test.com',
#         encrypted_password: '222222',
#         first_name: '菅',
#         last_name: '克昭',
#         first_name_ruby: 'スガ',
#         last_name_ruby: 'カツアキ',
#         phone_number: '222-2222-2222',
#         zip_code: '222-2222',
#         address: '神奈川県海老名市上郷2-2-2'
#      },
#      {
#         id: '3',
#         email: 'test3@test.com',
#         encrypted_password: '333333',
#         first_name: '内田',
#         last_name: '晃弘',
#         first_name_ruby: 'ウチダ',
#         last_name_ruby: 'アキヒロ',
#         phone_number: '333-3333-3333',
#         zip_code: '333-3333',
#         address: '神奈川県海老名市上郷3-3-3'
#      },
#      {
#         id: '4',
#         email: 'test4@test.com',
#         encrypted_password: '444444',
#         first_name: '山本',
#         last_name: '健剛',
#         first_name_ruby: 'ヤマモト',
#         last_name_ruby: 'ケンゴ',
#         phone_number: '444-4444-4444',
#         zip_code: '444-4444',
#         address: '神奈川県海老名市上郷4-4-4'
#      },
#      {
#         id: '5',
#         email: 'test5@test.com',
#         encrypted_password: '555555',
#         first_name: '大泉',
#         last_name: '洋',
#         first_name_ruby: 'オオイズミ',
#         last_name_ruby: 'ヨウ',
#         phone_number: '555-5555-5555',
#         zip_code: '555-5555',
#         address: '神奈川県海老名市上郷5-5-5'
#      },
#     ]
#   )

Artist.create!(
  [
    { id: 1, name: "平沢進" },
    { id: 2, name: "中野テルヲ" },
    { id: 3, name: "P-MODEL" }
  ]
)
Label.create!(
  [
    { id: 1, name: "ケイオスユニオン" },
    { id: 2, name: "Beat Sufers" }
  ]
)
Genre.create!(
  [
    { id: 1, name: "ニューエイジ・ミュージック" },
    { id: 2, name: "テクノポップ" }
  ]
)

Product.create!(
  [
    {
      id: 1,
      name: "時空の水",
      artist_id: 1,
      label_id: 1,
      genre_id: 1,
      price: 1200,
      stock: 24,
      jacket_image_id: "",
      summary: "ふっ！"
    }
  ]
)
Track.create!(
  [
    {
      id: 1,
      product_id: 1,
      disc: 1,
      number: 1,
      name: "時空の水",
      length: "04:00"
    },
    {
      id: 2,
      product_id: 1,
      disc: 1,
      number: 2,
      name: "バンディリア旅行団",
      length: "03:20"
    },
    {
      id: 3,
      product_id: 1,
      disc: 1,
      number: 3,
      name: "ハルディン・ホテル",
      length: "05:24"
    }
  ]
)
