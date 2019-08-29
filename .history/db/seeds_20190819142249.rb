Admin.create!(
   [
   {
      email: 'admin@test.com',
      password: '111111',
      remember_created_at: ""
    }
    ]
)

User.create!(
   [
   {
      id: '1',
      email: 'test1@test.com',
      password: '111111',
      last_name: '吉崎',
      first_name: '泰雅',
      last_name_ruby: 'ヨシザキ',
      first_name_ruby: 'タイガ',
      phone_number: '11111111111',
      zip_code: '1111111',
      address: '神奈川県海老名市上郷1-1-1'
   },
   {
      id: '2',
      email: 'test2@test.com',
      password: '222222',
      last_name: '菅',
      first_name: '克昭',
      last_name_ruby: 'スガ',
      first_name_ruby: 'カツアキ',
      phone_number: '22222222222',
      zip_code: '2222222',
      address: '神奈川県海老名市上郷2-2-2'
   },
   {
      id: '3',
      email: 'test3@test.com',
      password: '333333',
      last_name: '内田',
      first_name: '晃弘',
      last_name_ruby: 'ウチダ',
      first_name_ruby: 'アキヒロ',
      phone_number: '33333333333',
      zip_code: '3333333',
      address: '神奈川県海老名市上郷3-3-3'
   },
   {
      id: '4',
      email: 'test4@test.com',
      password: '444444',
      last_name: '山本',
      first_name: '健剛',
      last_name_ruby: 'ヤマモト',
      first_name_ruby: 'ケンゴ',
      phone_number: '44444444444',
      zip_code: '4444444',
      address: '神奈川県海老名市上郷4-4-4'
   },
   {
      id: '5',
      email: 'test5@test.com',
      password: '555555',
      last_name: '大泉',
      first_name: '洋',
      last_name_ruby: 'オオイズミ',
      first_name_ruby: 'ヨウ',
      phone_number: '55555555555',
      zip_code: '5555555',
      address: '神奈川県海老名市上郷5-5-5'
   },
   ]
)

Address.create!(
   [
   {
      id: '1',
      user_id: '1',
      name: '藤村忠寿',
      zip_code: '1234567',
      address: '鹿児島県千日町5-8',
   }
   ]
)