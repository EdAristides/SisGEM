# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_06_003214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipamentos", force: :cascade do |t|
    t.string "patrimonio"
    t.string "serial"
    t.date "dataAquisicao"
    t.string "status"
    t.bigint "modelo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modelo_id"], name: "index_equipamentos_on_modelo_id"
  end

  create_table "estoque_pecas", force: :cascade do |t|
    t.integer "quantidade"
    t.bigint "equipamento_id"
    t.bigint "peca_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipamento_id"], name: "index_estoque_pecas_on_equipamento_id"
    t.index ["peca_id"], name: "index_estoque_pecas_on_peca_id"
  end

  create_table "manutencaos", force: :cascade do |t|
    t.string "numOrdem"
    t.string "descricao"
    t.date "dataEntrada"
    t.date "dataSaida"
    t.string "status"
    t.bigint "equipamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipamento_id"], name: "index_manutencaos_on_equipamento_id"
  end

  create_table "modelos", force: :cascade do |t|
    t.string "marca"
    t.string "configuracao"
    t.float "valor"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pecas", force: :cascade do |t|
    t.string "nome"
    t.string "caracteristica"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servidors", force: :cascade do |t|
    t.string "siape"
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.string "cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "termo_compromissos", force: :cascade do |t|
    t.string "numTermo"
    t.date "dataVinculo"
    t.date "dataDevolucao"
    t.bigint "equipamento_id"
    t.bigint "servidor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipamento_id"], name: "index_termo_compromissos_on_equipamento_id"
    t.index ["servidor_id"], name: "index_termo_compromissos_on_servidor_id"
  end

end
