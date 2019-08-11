Admin.create!([{ email: 'admin@test.com', password: '111111',}])

User.create!(
    [
     {
        id: '1',
        email: 'test1@test.com',
        password: '111111',
        first_name: '吉崎',
        last_name: '泰雅',
        first_name_ruby: 'ヨシザキ',
        last_name_ruby: 'タイガ',
        phone_number: '11111111111',
        zip_code: '1111111',
        address: '神奈川県海老名市上郷1-1-1'
     },
     {
        id: '2',
        email: 'test2@test.com',
        password: '222222',
        first_name: '菅',
        last_name: '克昭',
        first_name_ruby: 'スガ',
        last_name_ruby: 'カツアキ',
        phone_number: '22222222222',
        zip_code: '2222222',
        address: '神奈川県海老名市上郷2-2-2'
     },
     {
        id: '3',
        email: 'test3@test.com',
        password: '333333',
        first_name: '内田',
        last_name: '晃弘',
        first_name_ruby: 'ウチダ',
        last_name_ruby: 'アキヒロ',
        phone_number: '33333333333',
        zip_code: '3333333',
        address: '神奈川県海老名市上郷3-3-3'
     },
     {
        id: '4',
        email: 'test4@test.com',
        password: '444444',
        first_name: '山本',
        last_name: '健剛',
        first_name_ruby: 'ヤマモト',
        last_name_ruby: 'ケンゴ',
        phone_number: '44444444444',
        zip_code: '4444444',
        address: '神奈川県海老名市上郷4-4-4'
     },
     {
        id: '5',
        email: 'test5@test.com',
        password: '555555',
        first_name: '大泉',
        last_name: '洋',
        first_name_ruby: 'オオイズミ',
        last_name_ruby: 'ヨウ',
        phone_number: '55555555555',
        zip_code: '5555555',
        address: '神奈川県海老名市上郷5-5-5'
     },
    ]
  )

