---
title: Intl.supportedValuesOf()
short-title: supportedValuesOf()
slug: Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf
page-type: javascript-static-method
browser-compat: javascript.builtins.Intl.supportedValuesOf
sidebar: jsref
---

Phương thức tĩnh **`Intl.supportedValuesOf()`** trả về một mảng chứa các giá trị calendar, collation, currency, numbering system, hoặc unit được hỗ trợ bởi implementation.

Các phần tử trùng lặp bị bỏ qua và mảng được sắp xếp theo thứ tự từ điển tăng dần (hay chính xác hơn, sử dụng {{jsxref("Array/sort", "Array.prototype.sort()")}} với hàm so sánh `undefined`).

Phương thức này có thể được dùng để kiểm tra tính năng xem các giá trị có được hỗ trợ trong một implementation cụ thể hay không và tải polyfill chỉ khi cần thiết. Nó cũng có thể được dùng để xây dựng UI cho phép người dùng chọn các giá trị bản địa hóa ưa thích của họ, ví dụ khi UI được tạo từ WebGL hoặc phía server.

Phương thức này không nhận biết locale: có thể một số identifier chỉ được hỗ trợ hoặc ưu tiên trong các locale nhất định. Nếu bạn muốn xác định các giá trị ưu tiên cho một locale cụ thể, hãy dùng đối tượng {{jsxref("Intl.Locale")}}, chẳng hạn {{jsxref("Intl/Locale/getCalendars", "Intl.Locale.prototype.getCalendars()")}}.

{{InteractiveExample("JavaScript Demo: Intl.supportedValuesOf()", "taller")}}

```js interactive-example
console.log(Intl.supportedValuesOf("calendar"));
console.log(Intl.supportedValuesOf("collation"));
console.log(Intl.supportedValuesOf("currency"));
console.log(Intl.supportedValuesOf("numberingSystem"));
console.log(Intl.supportedValuesOf("timeZone"));
console.log(Intl.supportedValuesOf("unit"));
// Expected output: Array ['key'] (for each key)

try {
  Intl.supportedValuesOf("someInvalidKey");
} catch (err) {
  console.log(err.toString());
  // Expected output: RangeError: invalid key: "someInvalidKey"
}
```

## Cú pháp

```js-nolint
Intl.supportedValuesOf(key)
```

### Tham số

- `key`
  - : Một chuỗi khóa chỉ ra danh mục giá trị cần trả về. Đây là một trong các giá trị:
    - `"calendar"`: xem [các loại calendar được hỗ trợ](#supported_calendar_types)
    - `"collation"`: xem [các loại collation được hỗ trợ](#supported_collation_types)
    - `"currency"`: xem [các identifier currency được hỗ trợ](#supported_currency_identifiers)
    - `"numberingSystem"`: xem [các loại numbering system được hỗ trợ](#supported_numbering_system_types)
    - `"timeZone"`: xem [các identifier time zone được hỗ trợ](#supported_time_zone_identifiers)
    - `"unit"`: xem [các identifier unit được hỗ trợ](#supported_unit_identifiers)

### Giá trị trả về

Một mảng được sắp xếp gồm các chuỗi duy nhất chỉ ra các giá trị được hỗ trợ bởi implementation cho key đã cho. Các giá trị có thể được trả về được liệt kê dưới đây.

#### Các loại calendar được hỗ trợ

Dưới đây là tất cả các giá trị thường được trình duyệt hỗ trợ cho khóa `calendar`. Các giá trị này có thể được dùng cho tùy chọn `calendar` hoặc [Unicode extension key](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument) `ca` khi tạo các đối tượng như {{jsxref("Intl.DateTimeFormat")}}, cũng như khi tạo các đối tượng date {{jsxref("Temporal")}}. Danh sách này được ECMA-402 specification chỉ định tường minh, vì vậy tất cả các implementation phải nhất quán.

| Value              | Description                                                                                                                                                                                                                                                                                                                                                               |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `buddhist`         | Thai Buddhist calendar, proleptic. Month numbers, month codes, and days are the same as in the ISO 8601 calendar, but the epoch year is different. There is one era.                                                                                                                                                                                                      |
| `chinese`          | Traditional Chinese calendar, proleptic. Lunisolar calendar used in China based on data published by the Purple Mountain Observatory between 1900 and 2100 (which compiles with GB/T 33661-2017 between 1912 and 2100), falling back to an implementation-defined approximation outside that range. The arithmetic year is identical to `gregory`, and there are no eras. |
| `coptic`           | Coptic calendar, proleptic. Similar solar algorithm to `ethioaa` and `ethiopic`, with one era and a different epoch year.                                                                                                                                                                                                                                                 |
| `dangi`            | Traditional Korean calendar, proleptic. Lunisolar calendar using months published by the Korea Astronomy and Space Science Institute (KASI) between 1900 and 2050, falling back to an implementation-defined approximation outside that range. The arithmetic year is identical to `gregory`, and there are no eras.                                                      |
| `ethioaa`          | Ethiopic calendar, Amete Alem, proleptic. Similar solar algorithm to `coptic` and `ethiopic`, with one era and a different epoch year.                                                                                                                                                                                                                                    |
| `ethiopic`         | Ethiopic calendar, Amete Mihret, proleptic. Similar solar algorithm to `coptic` and `ethioaa`, with two eras and a different epoch year.                                                                                                                                                                                                                                  |
| `gregory`          | Gregorian calendar, proleptic. Solar calendar almost identical to the ISO 8601 calendar, except that it does not define week numbering and it contains two eras, one before the epoch year.                                                                                                                                                                               |
| `hebrew`           | Hebrew calendar, proleptic. Civil calendar with Tishrei as the first month of the year. Lunisolar calendar with one leap month inserted after month 5. There is one era.                                                                                                                                                                                                  |
| `indian`           | Indian national (or Śaka) calendar, proleptic. Solar calendar with one era.                                                                                                                                                                                                                                                                                               |
| `islamic-civil`    | Hijri calendar, proleptic, tabular/rule-based with leap year rule II (leap years 2,5,7,10,13,16,18,21,24,26,29 in the 30-year cycle (1-based numbering)) and civil epoch (Friday July 16, 622 Julian / 0622-07-19 ISO)                                                                                                                                                    |
| `islamic-tbla`     | Hijri calendar, proleptic, tabular/rule-based with leap year rule II (leap years 2,5,7,10,13,16,18,21,24,26,29 in the 30-year cycle (1-based numbering)) and astronomical epoch (Thursday July 15, 622 Julian / 0622-07-18 ISO)                                                                                                                                           |
| `islamic-umalqura` | Hijri calendar, proleptic, Umm al-Qura. Lunar calendar using KACST-calculated months from the start of 1300 AH (1882-11-12 ISO) to the end of 1600 AH (2174-11-25 ISO), falling back to `islamic-civil` outside that range.                                                                                                                                               |
| `iso8601`          | ISO calendar (variant of the Gregorian calendar with week rules and formatting parameters made region-independent)                                                                                                                                                                                                                                                        |
| `japanese`         | Japanese Imperial calendar (this calendar adds an era for each new emperor, so the output year and era for a future date may not match the input year and era when your code runs on a future engine version. **Note:** See the remarks below this table about dates prior to 1868-10-23 ISO.)                                                                            |
| `persian`          | Persian (or Solar Hijri) calendar, proleptic. There is one era.                                                                                                                                                                                                                                                                                                           |
| `roc`              | Republic of China (or Minguo) calendar, proleptic. Month numbers, month codes, and days are the same as in the ISO 8601 calendar, but the epoch year is different. There are two eras, one before the epoch year and one after.                                                                                                                                           |

Tính đến tháng 10 năm 2025, trong lịch `japanese`, các ngày trước 1868-10-23 ISO (ngày bắt đầu của năm Meiji 1) không hoạt động đúng như mong đợi trong trình duyệt theo hai cách. Thứ nhất, [CLDR có ngày bắt đầu sai cho kỷ nguyên Meiji](https://unicode-org.atlassian.net/browse/CLDR-11375), khiến các implementation lịch mở rộng kỷ nguyên Meiji xa hơn trong quá khứ so với thực tế. Thứ hai, [đề xuất Intl era và monthCode](https://tc39.es/proposal-intl-era-monthcode/) sắp tới quy định rằng các ngày trước 1873-01-01 ISO nên dùng kỷ nguyên Gregorian, nhưng trình duyệt theo truyền thống đã dùng các xấp xỉ của các kỷ nguyên Nhật Bản trước đó. Lịch `japanese` được đưa vào sử dụng vào ngày 1 tháng 1, Meiji 6 / 1873-01-01 ISO, vì vậy các vấn đề này chỉ ảnh hưởng đến các ngày proleptic.

Các loại dưới đây được quy định trong CLDR nhưng không có implementation khác biệt so với các lịch trên trong trình duyệt.

| Value                            | Description                               | Notes                                                                                                                                                                                                                                                                                                                                        |
| -------------------------------- | ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ethiopic-amete-alem`            | Ethiopic calendar, Amete Alem, proleptic. | This is an alias for `ethioaa` and therefore is not returned by `supportedValuesOf()`. Use `ethioaa` instead.                                                                                                                                                                                                                                |
| `islamic`                        | Hijri calendar, unspecified algorithm.    | As of April 2025, this is an astronomical simulation whose parameters are undocumented and that is not known to match a specific Hijri calendar variant from non-software contexts. It is specified to be canonicalized to a different calendar, usually one of `islamic-umalqura`, `islamic-tbla`, or `islamic-civil`, and raise a warning. |
| `islamicc` {{deprecated_inline}} | Civil (algorithmic) Arabic calendar.      | This is an alias for `islamic-civil` and therefore is not returned by `supportedValuesOf()`. Use `islamic-civil` instead.                                                                                                                                                                                                                    |

Các tài liệu {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}} và {{jsxref("Temporal/PlainDate/monthCode", "Temporal.PlainDate.prototype.monthCode")}} cung cấp thêm thông tin về các lịch khác nhau.

Tài liệu tham khảo:

- [CLDR Calendar type keys](https://github.com/unicode-org/cldr/blob/main/common/bcp47/calendar.xml)
- [UTS 35, Dates](https://unicode.org/reports/tr35/tr35-dates.html)
- [Islamic calendar types](https://cldr.unicode.org/development/development-process/design-proposals/islamic-calendar-types) (CLDR design proposal)

#### Các loại collation được hỗ trợ

Dưới đây là tất cả các giá trị thường được trình duyệt hỗ trợ cho khóa `collation`. Các giá trị này có thể được dùng cho tùy chọn `collation` hoặc [Unicode extension key](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument) `co` khi tạo các đối tượng như {{jsxref("Intl.Collator")}}.

| Value      | Description                                                                                                                                                                                        |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `compat`   | A previous version of the ordering, for compatibility (for Arabic)                                                                                                                                 |
| `dict`     | Dictionary style ordering (for Sinhala). Also recognized as `dictionary`.                                                                                                                          |
| `emoji`    | Recommended ordering for emoji characters. The requested language has no effect, so combining this with a language that requires language-specific rules breaks sorting for text in that language! |
| `eor`      | European ordering rules (ENV 13710). This order is designed not to be language-specific. While the API requires attaching this to a language, the requested language has no effect on the order.   |
| `phonebk`  | Phonebook style ordering (for German). Also recognized as `phonebook`.                                                                                                                             |
| `phonetic` | Phonetic ordering (sorting based on pronunciation; for Lingala)                                                                                                                                    |
| `pinyin`   | Pinyin ordering for Latin and for Han characters (for Chinese)                                                                                                                                     |
| `searchjl` | Special collation type for Korean initial consonant search. **Warning:** This collation is not for sorting, even though you can only use it with {{jsxref("Intl.Collator")}} of `usage: "sort"`.   |
| `stroke`   | Pinyin ordering for Latin, stroke order for Han characters (for Chinese)                                                                                                                           |
| `trad`     | Traditional style ordering (such as in Spanish). Also recognized as `traditional`.                                                                                                                 |
| `unihan`   | Unihan radical-stroke ordering for Han characters (for Chinese, Japanese, and Korean), Pinyin ordering for Latin for Chinese and Japanese standard kana ordering for Japanese                      |
| `zhuyin`   | Pinyin ordering for Latin, zhuyin order for Bopomofo and Han characters (for Chinese)                                                                                                              |

Các loại dưới đây được quy định trong dữ liệu CLDR, nhưng đã deprecated, không nên dùng tường minh, và/hoặc có thể không được trình duyệt chỉ ra là được hỗ trợ vì nhiều lý do. Tránh sử dụng chúng:

| Value                            | Description                                                                                                             | Notes                                                                                                                                                                                                                                                                                                               |
| -------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `big5han` {{deprecated_inline}}  | Pinyin ordering for Latin, big5 charset ordering for CJK characters (used in Chinese)                                   | Deprecated.                                                                                                                                                                                                                                                                                                         |
| `direct` {{deprecated_inline}}   | Binary code point order (used in Hindi)                                                                                 | Deprecated.                                                                                                                                                                                                                                                                                                         |
| `ducet`                          | The default Unicode collation element table order                                                                       | The `ducet` collation type is not available to the Web.                                                                                                                                                                                                                                                             |
| `gb2312` {{deprecated_inline}}   | Pinyin ordering for Latin, gb2312han charset ordering for CJK characters (for Chinese). Also recognized as `gb2312han`. | Deprecated.                                                                                                                                                                                                                                                                                                         |
| `reformed` {{deprecated_inline}} | Reformed ordering (such as Swedish)                                                                                     | Deprecated. This is the old name for the default ordering for Swedish [whose collation naming used to differ from other languages](https://unicode-org.atlassian.net/browse/CLDR-15603). Since this was the default, request `sv` instead of requesting `sv-u-co-reformed`.                                         |
| `search`                         | Special collation type for string search                                                                                | Do not use as a collation type, since in {{jsxref("Intl.Collator")}}, this collation is activated via the `usage: "search"` option. There is currently no API for substring search, so this is currently only good for filtering a list of strings by trying a full-string match of the key against each list item. |
| `standard`                       | Default ordering for each language, except Chinese (and, previously, Swedish)                                           | Do not use explicitly. In general, it's unnecessary to specify this explicitly and specifying this for Swedish is problematic due to the different meaning for Swedish in the past.                                                                                                                                 |

Tài liệu tham khảo:

- [CLDR Collation type keys](https://github.com/unicode-org/cldr/blob/main/common/bcp47/collation.xml)
- [UTS 35, Collation](https://unicode.org/reports/tr35/tr35-collation.html)

#### Các identifier currency được hỗ trợ

Các identifier currency là các mã ba chữ in hoa được định nghĩa trong ISO 4217. Các giá trị này có thể được dùng cho tùy chọn `currency` khi tạo các đối tượng như {{jsxref("Intl.NumberFormat")}}, cũng như cho {{jsxref("Intl/DisplayNames/of", "Intl.DisplayNames.prototype.of()")}}. Có hơn 300 identifier thường dùng nên chúng tôi sẽ không liệt kê chúng. Để biết danh sách đầy đủ các identifier có thể có, xem [bài viết Wikipedia](https://en.wikipedia.org/wiki/ISO_4217#List_of_ISO_4217_currency_codes).

Tài liệu tham khảo:

- [CLDR Currency type keys](https://github.com/unicode-org/cldr/blob/main/common/bcp47/currency.xml)
- [ISO 4217 Currency codes](https://www.iso.org/iso-4217-currency-codes.html)
- [UTS 35, Currencies](https://unicode.org/reports/tr35/tr35-numbers.html#Currencies)

#### Các loại numbering system được hỗ trợ

Dưới đây là tất cả các giá trị thường được trình duyệt hỗ trợ cho khóa `numberingSystem`. Các giá trị này có thể được dùng cho tùy chọn `numberingSystem` hoặc [Unicode extension key](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument) `nu` khi tạo các đối tượng như {{jsxref("Intl.NumberFormat")}}. Đối với các hàng có "ký tự chữ số", runtime dịch các chữ số từng cái một mà không cần thao tác thêm. Các loại khác được đánh dấu là "algorithmic" cần các thuật toán bổ sung để dịch chữ số. Code point Unicode càng cao, numbering system càng mới và càng có khả năng không được tất cả trình duyệt hỗ trợ.

| Value      | Description                                                                | Digit characters                                                                                        |
| ---------- | -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `adlm`     | Adlam digits                                                               | `𞥐𞥑𞥒𞥓𞥔𞥕𞥖𞥗𞥘𞥙` (U+1E950 to U+1E959)                                                                       |
| `ahom`     | Ahom digits                                                                | `𑜰𑜱𑜲𑜳𑜴𑜵𑜶𑜷𑜸𑜹` (U+11730 to U+11739)                                                                       |
| `arab`     | Arabic-Indic digits                                                        | `٠١٢٣٤٥٦٧٨٩` (U+0660 to U+0669)                                                                         |
| `arabext`  | Extended Arabic-Indic digits                                               | `۰۰۱۲۳۴۵۶۷۸۹` (U+06F0 to U+06F9)                                                                        |
| `armn`     | Armenian upper case numerals                                               | algorithmic                                                                                             |
| `armnlow`  | Armenian lower case numerals                                               | algorithmic                                                                                             |
| `bali`     | Balinese digits                                                            | `᭐᭑᭒᭓᭔᭕᭖᭗᭘᭙` (U+1B50 to U+1B59)                                                                         |
| `beng`     | Bengali digits                                                             | `০১২৩৪৫৬৭৮৯` (U+09E6 to U+09EF)                                                                         |
| `bhks`     | Bhaiksuki digits                                                           | `𑱐𑱑𑱒𑱓𑱔𑱕𑱖𑱗𑱘𑱙` (U+11C50 to U+11C59)                                                                       |
| `brah`     | Brahmi digits                                                              | `𑁦𑁧𑁨𑁩𑁪𑁫𑁬𑁭𑁮𑁯` (U+11066 to U+1106F)                                                                       |
| `cakm`     | Chakma digits                                                              | `𑄶𑄷𑄸𑄹𑄺𑄻𑄼𑄽𑄾𑄿` (U+11136 to U+1113F)                                                                       |
| `cham`     | Cham digits                                                                | `꩐꩑꩒꩓꩔꩕꩖꩗꩘꩙` (U+AA50 to U+AA59)                                                                         |
| `cyrl`     | Cyrillic numerals                                                          | algorithmic                                                                                             |
| `deva`     | Devanagari digits                                                          | `०१२३४५६७८९` (U+0966 to U+096F)                                                                         |
| `diak`     | Dives Akuru digits                                                         | `𑥐𑥑𑥒𑥓𑥔𑥕𑥖𑥗𑥘𑥙` (U+11950 to U+11959)                                                                       |
| `ethi`     | Ethiopic numerals                                                          | algorithmic                                                                                             |
| `fullwide` | Full width digits                                                          | `０１２３４５６７８９` (U+FF10 to U+FF19)                                                               |
| `gara`     | Garay digits                                                               | `𐵀𐵁𐵂𐵃𐵄𐵅𐵆𐵇𐵈𐵉` (U+10D40 to U+10D49)                                                                       |
| `geor`     | Georgian numerals                                                          | algorithmic                                                                                             |
| `gong`     | Gunjala Gondi digits                                                       | `𑶠𑶡𑶢𑶣𑶤𑶥𑶦𑶧𑶨𑶩` (U+11DA0 to U+11DA9)                                                                       |
| `gonm`     | Masaram Gondi digits                                                       | `𑵐𑵑𑵒𑵓𑵔𑵕𑵖𑵗𑵘𑵙` (U+11D50 to U+11D59)                                                                       |
| `grek`     | Greek upper case numerals                                                  | algorithmic                                                                                             |
| `greklow`  | Greek lower case numerals                                                  | algorithmic                                                                                             |
| `gujr`     | Gujarati digits                                                            | `૦૧૨૩૪૫૬૭૮૯` (U+0AE6 to U+0AEF)                                                                         |
| `gukh`     | Gurung Khema digits                                                        | `𖄰𖄱𖄲𖄳𖄴𖄵𖄶𖄷𖄸𖄹` (U+16130 to U+16139)                                                                       |
| `guru`     | Gurmukhi digits                                                            | `੦੧੨੩੪੫੬੭੮੯` (U+0A66 to U+0A6F)                                                                         |
| `hanidays` | Han-character day-of-month numbering for lunar/other traditional calendars |                                                                                                         |
| `hanidec`  | Positional decimal system using Chinese number ideographs as digits        | `〇一二三四五六七八九` (U+3007, U+4E00, U+4E8C, U+4E09, U+56DB, U+4E94, U+516D, U+4E03, U+516B, U+4E5D) |
| `hans`     | Simplified Chinese numerals                                                | algorithmic                                                                                             |
| `hansfin`  | Simplified Chinese financial numerals                                      | algorithmic                                                                                             |
| `hant`     | Traditional Chinese numerals                                               | algorithmic                                                                                             |
| `hantfin`  | Traditional Chinese financial numerals                                     | algorithmic                                                                                             |
| `hebr`     | Hebrew numerals                                                            | algorithmic                                                                                             |
| `hmng`     | Pahawh Hmong digits                                                        | `𖭐𖭑𖭒𖭓𖭔𖭕𖭖𖭗𖭘𖭙` (U+16B50 to U+16B59)                                                                       |
| `hmnp`     | Nyiakeng Puachue Hmong digits                                              | `𞅀𞅁𞅂𞅃𞅄𞅅𞅆𞅇𞅈𞅉` (U+1E140 to U+1E149)                                                                       |
| `java`     | Javanese digits                                                            | `꧐꧑꧒꧓꧔꧕꧖꧗꧘꧙` (U+A9D0 to U+A9D9)                                                                         |
| `jpan`     | Japanese numerals                                                          | algorithmic                                                                                             |
| `jpanfin`  | Japanese financial numerals                                                | algorithmic                                                                                             |
| `jpanyear` | Japanese first-year Gannen numbering for Japanese calendar                 | algorithmic                                                                                             |
| `kali`     | Kayah Li digits                                                            | `꤀꤁꤂꤃꤄꤅꤆꤇꤈꤉` (U+A900 to U+A909)                                                                         |
| `kawi`     | Kawi digits                                                                | `𑽐𑽑𑽒𑽓𑽔𑽕𑽖𑽗𑽘𑽙` (U+11F50 to U+11F59)                                                                       |
| `khmr`     | Khmer digits                                                               | `០១២៣៤៥៦៧៨៩` (U+17E0 to U+17E9)                                                                         |
| `knda`     | Kannada digits                                                             | `೦೧೨೩೪೫೬೭೮೯` (U+0CE6 to U+0CEF)                                                                         |
| `krai`     | Kirat Rai digits                                                           | `𖵰𖵱𖵲𖵳𖵴𖵵𖵶𖵷𖵸𖵹` (U+16D70 to U+16D79)                                                                       |
| `lana`     | Tai Tham Hora (secular) digits                                             | `᪀᪁᪂᪃᪄᪅᪆᪇᪈᪉` (U+1A80 to U+1A89)                                                                         |
| `lanatham` | Tai Tham (ecclesiastical) digits                                           | `᪐᪑᪒᪓᪔᪕᪖᪗᪘᪙` (U+1A90 to U+1A99)                                                                         |
| `laoo`     | Lao digits                                                                 | `໐໑໒໓໔໕໖໗໘໙` (U+0ED0 to U+0ED9)                                                                         |
| `latn`     | Latin digits                                                               | `0123456789` (U+0030 to U+0039)                                                                         |
| `lepc`     | Lepcha digits                                                              | `᱀᱁᱂᱃᱄᱅᱆᱇᱈᱉` (U+1C40 to U+1C49)                                                                         |
| `limb`     | Limbu digits                                                               | `᥆᥇᥈᥉᥊᥋᥌᥍᥎᥏` (U+1946 to U+194F)                                                                         |
| `mathbold` | Mathematical bold digits                                                   | `𝟎𝟏𝟐𝟑𝟒𝟓𝟔𝟕𝟖𝟗` (U+1D7CE to U+1D7D7)                                                                       |
| `mathdbl`  | Mathematical double-struck digits                                          | `𝟘𝟙𝟚𝟛𝟜𝟝𝟞𝟟𝟠𝟡` (U+1D7D8 to U+1D7E1)                                                                       |
| `mathmono` | Mathematical monospace digits                                              | `𝟶𝟷𝟸𝟹𝟺𝟻𝟼𝟽𝟾𝟿` (U+1D7F6 to U+1D7FF)                                                                       |
| `mathsanb` | Mathematical sans-serif bold digits                                        | `𝟬𝟭𝟮𝟯𝟰𝟱𝟲𝟳𝟴𝟵` (U+1D7EC to U+1D7F5)                                                                       |
| `mathsans` | Mathematical sans-serif digits                                             | `𝟢𝟣𝟤𝟥𝟦𝟧𝟨𝟩𝟪𝟫` (U+1D7E2 to U+1D7EB)                                                                       |
| `mlym`     | Malayalam digits                                                           | `൦൧൨൩൪൫൬൭൮൯` (U+0D66 to U+0D6F)                                                                         |
| `modi`     | Modi digits                                                                | `𑙐𑙑𑙒𑙓𑙔𑙕𑙖𑙗𑙘𑙙` (U+11650 to U+11659)                                                                       |
| `mong`     | Mongolian digits                                                           | `᠐᠑᠒᠓᠔᠕᠖᠗᠘᠙` (U+1810 to U+1819)                                                                         |
| `mroo`     | Mro digits                                                                 | `𖩠𖩡𖩢𖩣𖩤𖩥𖩦𖩧𖩨𖩩` (U+16A60 to U+16A69)                                                                       |
| `mtei`     | Meetei Mayek digits                                                        | `꯰꯱꯲꯳꯴꯵꯶꯷꯸꯹` (U+ABF0 to U+ABF9)                                                                         |
| `mymr`     | Myanmar digits                                                             | `၀၁၂၃၄၅၆၇၈၉` (U+1040 to U+1049)                                                                         |
| `mymrepka` | Myanmar Eastern Pwo Karen digits                                           | `𑛚𑛛𑛜𑛝𑛞𑛟𑛠𑛡𑛢𑛣` (U+116DA to U+116E3)                                                                       |
| `mymrpao`  | Myanmar Pao digits                                                         | `𑛐𑛑𑛒𑛓𑛔𑛕𑛖𑛗𑛘𑛙` (U+116D0 to U+116D9)                                                                       |
| `mymrshan` | Myanmar Shan digits                                                        | `႐႑႒႓႔႕႖႗႘႙` (U+1090 to U+1099)                                                                         |
| `mymrtlng` | Myanmar Tai Laing digits                                                   | `꧰꧱꧲꧳꧴꧵꧶꧷꧸꧹` (U+A9F0 to U+A9F9)                                                                         |
| `nagm`     | Nag Mundari digits                                                         | `𞓰𞓱𞓲𞓳𞓴𞓵𞓶𞓷𞓸𞓹` (U+1E4F0 to U+1E4F9)                                                                       |
| `newa`     | Newa digits                                                                | `𑑐𑑑𑑒𑑓𑑔𑑕𑑖𑑗𑑘𑑙` (U+11450 to U+11459)                                                                       |
| `nkoo`     | N'Ko digits                                                                | `߀߁߂߃߄߅߆߇߈߉` (U+07C0 to U+07C9)                                                                         |
| `olck`     | Ol Chiki digits                                                            | `᱐᱑᱒᱓᱔᱕᱖᱗᱘᱙` (U+1C50 to U+1C59)                                                                         |
| `onao`     | Ol Onal digits                                                             | `𞗱𞗲𞗳𞗴𞗵𞗶𞗷𞗸𞗹𞗺` (U+1E5F1 to U+1E5FA)                                                                       |
| `orya`     | Oriya digits                                                               | `୦୧୨୩୪୫୬୭୮୯` (U+0B66 to U+0B6F)                                                                         |
| `osma`     | Osmanya digits                                                             | `𐒠𐒡𐒢𐒣𐒤𐒥𐒦𐒧𐒨𐒩` (U+104A0 to U+104A9)                                                                       |
| `outlined` | Legacy computing outlined digits                                           | `𜳰𜳱𜳲𜳳𜳴𜳵𜳶𜳷𜳸𜳹` (U+1CCF0 to U+1CCF9)                                                                       |
| `rohg`     | Hanifi Rohingya digits                                                     | `𐴰𐴱𐴲𐴳𐴴𐴵𐴶𐴷𐴸𐴹` (U+10D30 to U+10D39)                                                                       |
| `roman`    | Roman upper case numerals                                                  | algorithmic                                                                                             |
| `romanlow` | Roman lowercase numerals                                                   | algorithmic                                                                                             |
| `saur`     | Saurashtra digits                                                          | `꣐꣑꣒꣓꣔꣕꣖꣗꣘꣙` (U+A8D0 to U+A8D9)                                                                         |
| `segment`  | Legacy computing segmented digits                                          | `🯰🯱🯲🯳🯴🯵🯶🯷🯸🯹` (U+1FBF0 to U+1FBF9)                                                                       |
| `shrd`     | Sharada digits                                                             | `𑇐𑇑𑇒𑇓𑇔𑇕𑇖𑇗𑇘𑇙` (U+111D0 to U+111D9)                                                                       |
| `sind`     | Khudawadi digits                                                           | `𑋰𑋱𑋲𑋳𑋴𑋵𑋶𑋷𑋸𑋹` (U+112F0 to U+112F9)                                                                       |
| `sinh`     | Sinhala Lith digits                                                        | `෦෧෨෩෪෫෬෭෮෯` (U+0DE6 to U+0DEF)                                                                         |
| `sora`     | Sora_Sompeng digits                                                        | `𑃰𑃱𑃲𑃳𑃴𑃵𑃶𑃷𑃸𑃹` (U+110F0 to U+110F9)                                                                       |
| `sund`     | Sundanese digits                                                           | `᮰᮱᮲᮳᮴᮵᮶᮷᮸᮹` (U+1BB0 to U+1BB9)                                                                         |
| `sunu`     | Sunuwar digits                                                             | `𑯰𑯱𑯲𑯳𑯴𑯵𑯶𑯷𑯸𑯹` (U+11BF0 to U+11BF9)                                                                       |
| `takr`     | Takri digits                                                               | `𑛀𑛁𑛂𑛃𑛄𑛅𑛆𑛇𑛈𑛉` (U+116C0 to U+116C9)                                                                       |
| `talu`     | New Tai Lue digits                                                         | `᧐᧑᧒᧓᧔᧕᧖᧗᧘᧙` (U+19D0 to U+19D9)                                                                         |
| `taml`     | Tamil numerals                                                             | algorithmic                                                                                             |
| `tamldec`  | Modern Tamil decimal digits                                                | `௦௧௨௩௪௫௬௭௮௯` (U+0BE6 to U+0BEF)                                                                         |
| `telu`     | Telugu digits                                                              | `౦౧౨౩౪౫౬౭౮౯` (U+0C66 to U+0C6F)                                                                         |
| `thai`     | Thai digits                                                                | `๐๑๒๓๔๕๖๗๘๙` (U+0E50 to U+0E59)                                                                         |
| `tibt`     | Tibetan digits                                                             | `༠༡༢༣༤༥༦༧༨༩` (U+0F20 to U+0F29)                                                                         |
| `tirh`     | Tirhuta digits                                                             | `𑓐𑓑𑓒𑓓𑓔𑓕𑓖𑓗𑓘𑓙` (U+114D0 to U+114D9)                                                                       |
| `tnsa`     | Tangsa digits                                                              | `𖫀𖫁𖫂𖫃𖫄𖫅𖫆𖫇𖫈𖫉` (U+16AC0 to U+16AC9)                                                                       |
| `vaii`     | Vai digits                                                                 | `꘠꘡꘢꘣꘤꘥꘦꘧꘨꘩` (U+A620 to U+A629)                                                                         |
| `wara`     | Warang Citi digits                                                         | `𑣠𑣡𑣢𑣣𑣤𑣥𑣦𑣧𑣨𑣩` (U+118E0 to U+118E9)                                                                       |
| `wcho`     | Wancho digits                                                              | `𞋰𞋱𞋲𞋳𞋴𞋵𞋶𞋷𞋸𞋹` (U+1E2F0 to U+1E2F9)                                                                       |

Có ba giá trị đặc biệt: `native`, `traditio`, và `finance`, có nghĩa phụ thuộc vào locale và sẽ được giải quyết thành hệ thống phù hợp tùy theo locale. Do đó, các phương thức `resolvedOptions()` sẽ không bao giờ trả về các giá trị này, nhưng `Intl.Locale.prototype.numberingSystem` sẽ trả về (nếu được cung cấp làm đầu vào).

Tài liệu tham khảo:

- [CLDR Numbering system type keys](https://github.com/unicode-org/cldr/blob/main/common/bcp47/number.xml)
- [CLDR Numbering system definitions](https://github.com/unicode-org/cldr/blob/main/common/supplemental/numberingSystems.xml)
- [UTS 35, Numbering systems](https://unicode.org/reports/tr35/tr35-numbers.html#Numbering_Systems)

#### Các identifier time zone được hỗ trợ

Các identifier time zone được hỗ trợ có thể được dùng cho tùy chọn `timeZone` khi tạo các đối tượng như {{jsxref("Intl.DateTimeFormat")}}, cũng như khi tạo các đối tượng date {{jsxref("Temporal")}}. Có hơn 400 identifier thường dùng nên chúng tôi sẽ không liệt kê chúng. Để biết danh sách đầy đủ các identifier có thể có, xem [bài viết Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) hoặc [cơ sở dữ liệu múi giờ IANA](https://www.iana.org/time-zones).

Khi duyệt danh sách, lưu ý rằng việc chuẩn hóa `Temporal` yêu cầu trình duyệt luôn trả về identifier chính trong cơ sở dữ liệu IANA, có thể thay đổi theo thời gian. Xem [time zones and offsets](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin. Ví dụ, mảng được trả về nên chứa `"Asia/Kolkata"` thay vì `"Asia/Calcutta"` vì cái sau là alias của cái trước và cả hai đều tương ứng với Ấn Độ; tuy nhiên, nó nên chứa cả `"Africa/Abidjan"` và `"Atlantic/Reykjavik"` vì chúng ở các quốc gia khác nhau, mặc dù cái sau cũng là alias của cái trước.

Tài liệu tham khảo:

- [IANA Time Zone Database](https://www.iana.org/time-zones)
- [UTS 35, Time Zone Identifiers](https://unicode.org/reports/tr35/tr35-dates.html#Time_Zone_Identifiers)

#### Các identifier unit được hỗ trợ

Dưới đây là tất cả các giá trị thường được trình duyệt hỗ trợ cho khóa `unit`. Các giá trị này có thể được dùng cho tùy chọn `unit` khi tạo các đối tượng như {{jsxref("Intl.NumberFormat")}}. Danh sách này là tập con của CLDR được ECMA-402 specification chỉ định tường minh, vì vậy tất cả các implementation phải nhất quán.

- `acre`
- `bit`
- `byte`
- `celsius`
- `centimeter`
- `day`
- `degree`
- `fahrenheit`
- `fluid-ounce`
- `foot`
- `gallon`
- `gigabit`
- `gigabyte`
- `gram`
- `hectare`
- `hour`
- `inch`
- `kilobit`
- `kilobyte`
- `kilogram`
- `kilometer`
- `liter`
- `megabit`
- `megabyte`
- `meter`
- `microsecond`
- `mile`
- `mile-scandinavian`
- `milliliter`
- `millimeter`
- `millisecond`
- `minute`
- `month`
- `nanosecond`
- `ounce`
- `percent`
- `petabyte`
- `pound`
- `second`
- `stone`
- `terabit`
- `terabyte`
- `week`
- `yard`
- `year`

Khi chỉ định các đơn vị, bạn cũng có thể kết hợp hai đơn vị với dấu phân cách "-per-". Ví dụ, `meter-per-second` hoặc `liter-per-megabyte`.

Tài liệu tham khảo:

- [ECMA-402 sanctioned single units](https://tc39.es/ecma402/#table-sanctioned-single-unit-identifiers)
- [CLDR Unit validity data](https://github.com/unicode-org/cldr/blob/main/common/validity/unit.xml)
- [UTS 35, Unit identifiers](https://unicode.org/reports/tr35/tr35-general.html#Unit_Identifiers)

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu một khóa không được hỗ trợ được truyền làm tham số.

## Ví dụ

### Kiểm tra tính năng

Bạn có thể kiểm tra phương thức được hỗ trợ hay không bằng cách so sánh với `undefined`:

```js
if (typeof Intl.supportedValuesOf !== "undefined") {
  // method is supported
}
```

### Lấy tất cả giá trị cho một khóa

Để lấy các giá trị được hỗ trợ cho calendar, bạn gọi phương thức với khóa `"calendar"`. Sau đó bạn có thể lặp qua mảng được trả về như dưới đây:

```js
Intl.supportedValuesOf("calendar").forEach((calendar) => {
  // "buddhist", "chinese", "coptic", "dangi", etc.
});
```

Các giá trị khác đều thu được theo cách tương tự:

```js
Intl.supportedValuesOf("collation").forEach((collation) => {
  // "compat", "dict", "emoji", etc.
});

Intl.supportedValuesOf("currency").forEach((currency) => {
  // "ADP", "AED", "AFA", "AFN", "ALK", "ALL", "AMD", etc.
});

Intl.supportedValuesOf("numberingSystem").forEach((numberingSystem) => {
  // "adlm", "ahom", "arab", "arabext", "bali", etc.
});

Intl.supportedValuesOf("timeZone").forEach((timeZone) => {
  // "Africa/Abidjan", "Africa/Accra", "Africa/Addis_Ababa", "Africa/Algiers", etc.
});

Intl.supportedValuesOf("unit").forEach((unit) => {
  // "acre", "bit", "byte", "celsius", "centimeter", etc.
});
```

### Khóa không hợp lệ ném ra RangeError

```js
try {
  Intl.supportedValuesOf("someInvalidKey");
} catch (err) {
  // RangeError: invalid key: "someInvalidKey"
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.supportedValuesOf` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-supportedvaluesof/)
- {{jsxref("Intl")}}
