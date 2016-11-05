﻿Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq

Public Class BacaJSONDAL


    Private datajson As String = "{
  'metadata': {
    'code': '200',
    'message': 'OK'
  },
  'response': {
    'peserta': {
      'informasi': {
        'dinsos': null,
        'iuran': '',
        'noSKTM': null,
        'prolanisPRB': null
      },
      'jenisPeserta': {
        'kdJenisPeserta': '14',
        'nmJenisPeserta': 'PEKERJA MANDIRI'
      },
      'kelasTanggungan': {
        'kdKelas': '3',
        'nmKelas': 'KELAS III'
      },
      'nama': 'NY.SRI HARTINI',
      'nik': '3471115406490001',
      'noKartu': '0001827821147',
      'noMr': '00000001',
      'pisa': '3',
      'provUmum': {
        'kdCabang': '',
        'kdProvider': '12010501',
        'nmCabang': '',
        'nmProvider': 'PAKUALAMAN'
      },
      'sex': 'P',
      'statusPeserta': {
        'keterangan': 'AKTIF',
        'kode': '0'
      },
      'tglCetakKartu': '2015-03-02',
      'tglLahir': '1949-06-14',
      'tglTAT': '2050-01-01',
      'tglTMT': '2015-03-02',
      'umur': {
        'umurSaatPelayanan': '',
        'umurSekarang': '67 tahun ,5 bulan ,10 hari'
      }
    }
  }
}"
    Public Function GetJenisPeserta() As String
        Dim rss As JObject = JObject.Parse(datajson)
        Dim rssPeserta As String = CType(rss("response")("peserta")("jenisPeserta")("nmJenisPeserta"), String)
        Return rssPeserta
    End Function


End Class
