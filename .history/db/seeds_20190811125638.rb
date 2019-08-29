# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    [
     {
        id: '1',
        mail: 'test1@test.com',
        encrypted_password: '111111',
        first_name: '吉崎',
        last_name: '泰雅',
        first_name_ruby: 'ヨシザキ',
        last_name_ruby: 'タイガ',
        phone_number: '111-1111-1111',
        zip_code: '111-1111',
        address: '神奈川県海老名市上郷1-1-1'
     },
     {
        id: '2',
        mail: 'test2@test.com',
        encrypted_password: '222222',
        first_name: '菅',
        last_name: '克昭',
        first_name_ruby: 'スガ',
        last_name_ruby: 'カツアキ',
        phone_number: '222-2222-2222',
        zip_code: '222-2222',
        address: '神奈川県海老名市上郷2-2-2'
     },
     {
        id: '3',
        mail: 'test3@test.com',
        encrypted_password: '333333',
        first_name: '内田',
        last_name: '晃弘',
        first_name_ruby: 'ウチダ',
        last_name_ruby: 'アキヒロ',
        phone_number: '333-3333-3333',
        zip_code: '333-3333',
        address: '神奈川県海老名市上郷3-3-3'
     },
     {
        id: '4',
        mail: 'test4@test.com',
        encrypted_password: '444444',
        first_name: '山本',
        last_name: '健剛',
        first_name_ruby: 'ヤマモト',
        last_name_ruby: 'ケンゴ',
        phone_number: '444-4444-4444',
        zip_code: '444-4444',
        address: '神奈川県海老名市上郷4-4-4'
     },
     {
        id: '5',
        mail: 'test5@test.com',
        encrypted_password: '555555',
        first_name: '大泉',
        last_name: '洋',
        first_name_ruby: 'オオイズミ',
        last_name_ruby: 'ヨウ',
        phone_number: '555-5555-5555',
        zip_code: '555-5555',
        address: '神奈川県海老名市上郷5-5-5'
     },
    ]
  )