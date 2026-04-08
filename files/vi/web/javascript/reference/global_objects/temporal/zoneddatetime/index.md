---
title: Temporal.ZonedDateTime
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime
page-type: javascript-class
browser-compat: javascript.builtins.Temporal.ZonedDateTime
sidebar: jsref
---

Đối tượng **`Temporal.ZonedDateTime`** biểu thị một ngày và giờ với múi giờ. Về cơ bản nó được biểu diễn như là sự kết hợp của một [instant](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant), một múi giờ và một hệ thống lịch.

## Mô tả

`ZonedDateTime` hoạt động như một cầu nối giữa thời gian chính xác và thời gian đồng hồ: nó đồng thời biểu thị một thời điểm trong lịch sử (như {{jsxref("Temporal.Instant")}}) và một thời gian đồng hồ địa phương (như {{jsxref("Temporal.PlainDateTime")}}). Nó thực hiện điều này bằng cách lưu trữ thời điểm, múi giờ và hệ thống lịch. Múi giờ được sử dụng để chuyển đổi giữa thời điểm và giờ địa phương, và hệ thống lịch được sử dụng để diễn giải giờ địa phương.

`ZonedDateTime` là lớp `Temporal` duy nhất nhận biết múi giờ. Việc thêm múi giờ khiến các đối tượng `ZonedDateTime` có sự khác biệt hành vi quan trọng so với các đối tượng {{jsxref("Temporal.PlainDateTime")}}. Cụ thể, bạn không còn có thể giả định rằng "thời gian 1 phút sau" là giống nhau mỗi ngày, hoặc một ngày có 24 giờ. Trong trường hợp xấu nhất, một ngày toàn bộ có thể bị thiếu trong lịch địa phương. Dưới đây, chúng tôi cung cấp tổng quan nhanh về múi giờ và offset và cách chúng ảnh hưởng đến việc chuyển đổi giữa giờ UTC và giờ địa phương.

### Múi giờ và offset

Tất cả các thời gian trong JavaScript có một tiêu chuẩn vàng: giờ UTC, tăng liên tục và đồng đều theo thời gian vật lý tiến triển. Ngược lại, người dùng quan tâm hơn đến giờ địa phương của họ, là thời gian họ đọc trên lịch và đồng hồ của mình. Quá trình chuyển đổi giữa giờ UTC và giờ địa phương liên quan đến _offset_ múi giờ, được tính như sau:

```plain
local time = UTC time + offset
```

Ví dụ, nếu giờ UTC là 1970-01-01T00:00:00 và offset là "-05:00", thì giờ địa phương là:

```plain
1970-01-01T00:00:00 + -05:00 = 1969-12-31T19:00:00
```

Bằng cách gắn thêm giờ địa phương này với offset, do đó biểu thị thời gian này là "1969-12-31T19:00:00-05:00", nó có thể được hiểu một cách rõ ràng như một thời điểm trong lịch sử.

Để biết offset, chúng ta cần hai thông tin: _múi giờ_ và _thời điểm_. Múi giờ là một khu vực trên Trái đất nơi cùng offset được sử dụng mọi lúc. Hai đồng hồ trong cùng múi giờ sẽ luôn hiển thị cùng thời gian đồng thời, nhưng offset không nhất thiết phải không đổi: nghĩa là, thời gian của các đồng hồ này có thể thay đổi đột ngột. Điều này thường xảy ra trong quá trình chuyển đổi giờ tiết kiệm ánh sáng ban ngày (DST), khi offset thay đổi một giờ, xảy ra hai lần một năm. Offset cũng có thể thay đổi vĩnh viễn do những thay đổi chính trị, ví dụ, một quốc gia chuyển đổi múi giờ.

Các múi giờ được lưu trữ trong [Cơ sở dữ liệu múi giờ IANA](https://www.iana.org/time-zones). Mỗi múi giờ IANA có:

- Một _định danh múi giờ chính_ xác định duy nhất múi giờ. Nó thường đề cập đến một khu vực địa lý được neo bởi một thành phố (ví dụ, `Europe/Paris` hoặc `Africa/Kampala`), nhưng cũng có thể biểu thị các múi giờ offset đơn như `UTC` (offset `+00:00` nhất quán) hoặc `Etc/GMT+5` (vì lý do lịch sử là offset âm `-05:00`). Vì lý do lịch sử, tên chính cho múi giờ UTC là `UTC`, mặc dù trong IANA nó là `Etc/UTC`.
- Một _định nghĩa múi giờ_ dưới dạng bảng ánh xạ các khoảng ngày/giờ UTC (bao gồm các khoảng trong tương lai) đến các offset cụ thể.
- Không hoặc nhiều _định danh múi giờ không chính_ là bí danh của định danh múi giờ chính. Đây thường là các tên lịch sử không còn được sử dụng, nhưng được giữ lại vì lý do tương thích. Xem bên dưới để biết thêm thông tin.

Là đầu vào, các định danh được đặt tên khớp không phân biệt chữ hoa chữ thường. Nội bộ, chúng được lưu trữ theo chữ hoa chữ thường ưu tiên, và các định danh không chính _sẽ không_ được chuyển đổi thành định danh chính của chúng.

> [!NOTE]
> Khi đặt tên múi giờ, bạn hiếm khi muốn đặt nó thành `"UTC"`. `ZonedDateTime` được thiết kế để hiển thị cho người dùng, nhưng không có người nào sống trong múi giờ "UTC". Nếu bạn không biết múi giờ tại thời điểm xây dựng nhưng biết giờ đồng hồ, hãy sử dụng {{jsxref("Temporal.PlainDateTime")}}. Nếu bạn biết thời điểm chính xác, hãy sử dụng {{jsxref("Temporal.Instant")}}.

Khi một API `Temporal` chấp nhận _định danh múi giờ_, ngoài các định danh múi giờ chính và không chính, nó cũng chấp nhận _định danh múi giờ offset_, có cùng dạng như offset, ngoại trừ độ chính xác dưới phút không được phép. Ví dụ, `+05:30`, `-08`, `+0600` đều là các định danh offset hợp lệ. Nội bộ, các định danh offset được lưu trữ ở dạng `±HH:mm`.

> [!NOTE]
> Tránh sử dụng các định danh offset nếu có định danh được đặt tên bạn có thể sử dụng thay thế. Ngay cả khi một khu vực luôn sử dụng một offset duy nhất, tốt hơn là sử dụng định danh được đặt tên để bảo vệ trước các thay đổi chính trị trong tương lai đối với offset.
>
> Nếu một khu vực sử dụng (hoặc đã sử dụng) nhiều offset, thì việc sử dụng múi giờ được đặt tên của nó còn quan trọng hơn. Điều này là vì `Temporal.ZonedDateTime` có thể sử dụng các phương thức như `add` hoặc `with` để tạo các thực thể mới tại một thời điểm khác. Nếu các thực thể dẫn xuất đó tương ứng với một thời điểm sử dụng offset khác (ví dụ, sau khi chuyển đổi Giờ Tiết kiệm Ánh sáng Ban ngày), thì các phép tính của bạn sẽ có giờ địa phương không chính xác. Sử dụng múi giờ được đặt tên đảm bảo rằng ngày và giờ địa phương luôn được điều chỉnh theo offset chính xác cho thời điểm đó.

Để thuận tiện, khi cung cấp định danh múi giờ cho các API `Temporal` như `Temporal.ZonedDateTime.prototype.withTimeZone()` và tùy chọn `timeZoneId` của `Temporal.ZonedDateTime.from()`, bạn có thể cung cấp nó ở một số dạng khác:

- Như một thực thể `ZonedDateTime` khác, `timeZoneId` của nó sẽ được sử dụng.
- Như một [chuỗi RFC 9557](#rfc_9557_format) với annotation múi giờ, định danh múi giờ của nó sẽ được sử dụng.
- Như một chuỗi ISO 8601 / RFC 3339 chứa offset, offset của nó sẽ được sử dụng làm định danh offset; hoặc, nếu sử dụng `Z`, thì múi giờ `"UTC"` được sử dụng. Cách sử dụng này thường không được khuyến nghị, vì như đã thảo luận ở trên, các định danh offset thiếu khả năng an toàn để suy ra các thực thể `Temporal.ZonedDateTime` khác qua quá trình chuyển đổi offset như khi DST bắt đầu hoặc kết thúc. Thay vào đó, hãy xem xét chỉ sử dụng `Temporal.Instant` hoặc lấy múi giờ được đặt tên thực tế của người dùng.

Cơ sở dữ liệu múi giờ IANA thay đổi theo thời gian, thường để thêm múi giờ mới để đáp ứng với những thay đổi chính trị. Tuy nhiên, trong những dịp hiếm hoi, các định danh múi giờ IANA được đổi tên để khớp với bản dịch tiếng Anh được cập nhật của tên thành phố hoặc để cập nhật các quy ước đặt tên đã lỗi thời. Ví dụ, đây là một số thay đổi tên đáng chú ý:

| Định danh IANA chính hiện tại    | Định danh cũ, nay không chính |
| -------------------------------- | ----------------------------- |
| `America/Argentina/Buenos_Aires` | `America/Buenos_Aires`        |
| `Asia/Kolkata`                   | `Asia/Calcutta`               |
| `Asia/Ho_Chi_Minh`               | `Asia/Saigon`                 |
| `Europe/Kyiv`                    | `Europe/Kiev`                 |

Trong lịch sử, những việc đổi tên này gây ra vấn đề cho các lập trình viên vì cơ sở dữ liệu Unicode [CLDR](https://github.com/unicode-org/cldr/blob/main/common/bcp47/timezone.xml) (một thư viện được trình duyệt sử dụng để cung cấp các định danh và dữ liệu múi giờ) không tuân theo việc đổi tên của IANA vì [lý do ổn định](https://unicode.org/reports/tr35/#Time_Zone_Identifiers). Kết quả là, một số trình duyệt như Chrome và Safari báo cáo các định danh lỗi thời của CLDR, trong khi các trình duyệt khác như Firefox ghi đè mặc định của CLDR và báo cáo các định danh chính được cập nhật.

Với sự ra đời của Temporal, hành vi này hiện được tiêu chuẩn hóa hơn:

- [Dữ liệu CLDR](https://github.com/unicode-org/cldr/blob/main/common/bcp47/timezone.xml) hiện bao gồm thuộc tính `"_iana"` chỉ ra định danh được cập nhật nhất nếu định danh cũ, ổn định đã được đổi tên. Các trình duyệt có thể sử dụng thuộc tính mới này để cung cấp các định danh được cập nhật cho người gọi.
- Các định danh múi giờ được cung cấp bởi lập trình viên sẽ không bao giờ được thay thế bằng bí danh. Ví dụ, nếu người gọi cung cấp `Asia/Calcutta` hoặc `Asia/Kolkata` làm đầu vào định danh cho {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}, thì cùng định danh đó được trả về trong {{jsxref("Temporal/ZonedDateTime/timeZoneId", "timeZoneId")}} của thực thể kết quả. Lưu ý rằng chữ hoa chữ thường của đầu ra được chuẩn hóa để khớp với IANA, vì vậy `ASIA/calCuTTa` là đầu vào tạo ra `timeZoneId` là `Asia/Calcutta` là đầu ra.
- Khi định danh múi giờ không được cung cấp bởi người gọi mà thay vào đó được lấy từ chính hệ thống (ví dụ, khi sử dụng {{jsxref("Temporal/Now/timeZoneId", "Temporal.Now.timeZoneId()")}}), các định danh hiện đại được trả về trong tất cả các trình duyệt. Đối với các lần đổi tên thành phố, có độ trễ hai năm trước khi các API định danh được cung cấp bởi hệ thống này hiển thị tên mới, từ đó cho các thành phần khác (như máy chủ Node) thời gian để cập nhật bản sao cơ sở dữ liệu IANA của họ để nhận ra tên mới.

Lưu ý rằng việc quy định các định danh chính bảo tồn mã quốc gia: ví dụ, cơ sở dữ liệu IANA ghi lại `Atlantic/Reykjavik` là bí danh của `Africa/Abidjan`, nhưng vì chúng tương ứng với các quốc gia khác nhau (Iceland và Côte d'Ivoire, tương ứng), chúng được coi là các định danh chính riêng biệt.

Việc tiêu chuẩn hóa này áp dụng bên ngoài `Temporal` cũng vậy. Ví dụ, tùy chọn `timeZone` được trả về bởi {{jsxref("Intl/DateTimeFormat/resolvedOptions", "Intl.DateTimeFormat.prototype.resolvedOptions()")}} cũng không bao giờ được thay thế bằng bí danh, mặc dù các trình duyệt theo truyền thống đã chuẩn hóa các định danh này trước khi được tiêu chuẩn hóa bởi Temporal. Mặt khác, {{jsxref("Intl/Locale/getTimeZones", "Intl.Locale.prototype.getTimeZones()")}} và {{jsxref("Intl.supportedValuesOf()")}} (tùy chọn `timeZone`) sẽ trả về định danh được cập nhật nhất, trong khi một số trình duyệt trước đây trả về định danh cũ, không chính.

### Định dạng RFC 9557

Các đối tượng `ZonedDateTime` có thể được tuần tự hóa và phân tích bằng định dạng [RFC 9557](https://datatracker.ietf.org/doc/html/rfc9557), một phần mở rộng của định dạng [ISO 8601 / RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339). Chuỗi có dạng sau (khoảng trắng chỉ để dễ đọc và không nên có trong chuỗi thực tế):

```plain
YYYY-MM-DD T HH:mm:ss.sssssssss Z/±HH:mm [time_zone_id] [u-ca=calendar_id]
```

- `YYYY`
  - : Số bốn chữ số, hoặc số sáu chữ số có dấu `+` hoặc `-`.
- `MM`
  - : Số hai chữ số từ `01` đến `12`.
- `DD`
  - : Số hai chữ số từ `01` đến `31`. Các thành phần `YYYY`, `MM` và `DD` có thể được phân tách bằng `-` hoặc không có gì.
- `T` {{optional_inline}}
  - : Dấu phân cách ngày-giờ, có thể là `T`, `t`, hoặc dấu cách. Có mặt khi và chỉ khi `HH` có mặt.
- `HH` {{optional_inline}}
  - : Số hai chữ số từ `00` đến `23`. Mặc định là `00`.
- `mm` {{optional_inline}}
  - : Số hai chữ số từ `00` đến `59`. Mặc định là `00`.
- `ss.sssssssss` {{optional_inline}}
  - : Số hai chữ số từ `00` đến `59`. Có thể tùy chọn theo sau là `.` hoặc `,` và một đến chín chữ số. Mặc định là `00`. Các thành phần `HH`, `mm` và `ss` có thể được phân tách bằng `:` hoặc không có gì. Bạn có thể bỏ qua chỉ `ss` hoặc cả `ss` và `mm`, vì vậy thời gian có thể ở một trong ba dạng: `HH`, `HH:mm`, hoặc `HH:mm:ss.sssssssss`.
- `Z/±HH:mm` {{optional_inline}}
  - : Ký hiệu UTC `Z` hoặc `z`, hoặc offset từ UTC ở dạng `+` hoặc `-` theo sau bởi cùng định dạng như thành phần thời gian. Lưu ý rằng độ chính xác dưới phút (`:ss.sssssssss`) có thể không được hỗ trợ bởi các hệ thống khác, và được chấp nhận nhưng không bao giờ được xuất ra. Nếu bỏ qua, offset được suy ra từ định danh múi giờ. Nếu có mặt, thì thời gian phải được cung cấp cũng vậy. `Z` không giống với `+00:00`: cái trước có nghĩa là thời gian được đưa ra ở dạng UTC bất kể định danh múi giờ, trong khi cái sau có nghĩa là thời gian được đưa ra theo giờ địa phương tình cờ là UTC+0, và sẽ được xác thực dựa trên định danh múi giờ thông qua [tùy chọn `offset`](#offset_ambiguity).
- `[time_zone_id]`
  - : Thay `time_zone_id` bằng định danh múi giờ (được đặt tên hoặc offset) như mô tả ở trên. Có thể có _cờ quan trọng_ bằng cách thêm tiền tố `!` vào định danh: ví dụ, `[!America/New_York]`. Cờ này thường cho các hệ thống khác biết rằng nó không thể bị bỏ qua nếu họ không hỗ trợ nó. Lưu ý rằng nó bắt buộc cho `Temporal.ZonedDateTime.from()`: bỏ qua nó gây ra `RangeError`. Nếu bạn muốn phân tích các chuỗi ISO 8601 / RFC 3339 mà không có annotation định danh múi giờ, hãy sử dụng {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}} thay thế.
- `[u-ca=calendar_id]` {{optional_inline}}
  - : Thay `calendar_id` bằng lịch cần sử dụng. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `[u-ca=iso8601]`. Có thể có _cờ quan trọng_ bằng cách thêm tiền tố `!` vào khóa: ví dụ, `[!u-ca=iso8601]`. Cờ này thường cho các hệ thống khác biết rằng nó không thể bị bỏ qua nếu họ không hỗ trợ nó. Parser `Temporal` sẽ ném lỗi nếu các annotation chứa hai hoặc nhiều annotation lịch và một trong số chúng là quan trọng. Lưu ý rằng `YYYY-MM-DD` luôn được diễn giải là ngày lịch ISO 8601 và sau đó chuyển đổi sang lịch được chỉ định.

Là đầu vào, các annotation khác ở định dạng `[key=value]` bị bỏ qua, và chúng không được có cờ quan trọng.

Khi tuần tự hóa, bạn có thể cấu hình số chữ số phần thập phân của giây, có hiển thị offset/ID múi giờ/ID lịch hay không, và có thêm cờ quan trọng cho các annotation hay không.

### Sự mơ hồ và khoảng trống từ giờ địa phương đến UTC

Cho một múi giờ, việc chuyển đổi từ UTC sang giờ địa phương rất đơn giản: trước tiên bạn lấy offset bằng tên múi giờ và thời điểm, sau đó cộng offset vào thời điểm. Điều ngược lại không đúng: việc chuyển đổi từ giờ địa phương sang UTC, mà không có offset rõ ràng, là không rõ ràng, vì một giờ địa phương có thể tương ứng với không, một hoặc nhiều giờ UTC. Hãy xem xét nguyên nhân phổ biến nhất: chuyển đổi giờ tiết kiệm ánh sáng ban ngày. Lấy New York làm ví dụ. Offset chuẩn của nó là UTC-5, nhưng trong DST, tất cả đồng hồ được đặt tiến một giờ, vì vậy offset trở thành UTC-4. Ở Mỹ, chuyển đổi xảy ra lúc 2:00 SA giờ địa phương, vì vậy hãy xem xét hai ngày chuyển đổi này:

| Giờ UTC              | Giờ New York              |
| -------------------- | ------------------------- |
| 2024-03-10T06:58:00Z | 2024-03-10T01:58:00-05:00 |
| 2024-03-10T06:59:00Z | 2024-03-10T01:59:00-05:00 |
| 2024-03-10T07:00:00Z | 2024-03-10T03:00:00-04:00 |
| ---                  | ---                       |
| 2024-11-03T05:58:00Z | 2024-11-03T01:58:00-04:00 |
| 2024-11-03T05:59:00Z | 2024-11-03T01:59:00-04:00 |
| 2024-11-03T06:00:00Z | 2024-11-03T01:00:00-05:00 |

Như bạn có thể thấy, vào tháng 3, một giờ đã biến mất khỏi giờ địa phương, và vào tháng 11, chúng ta có hai giờ có cùng giờ đồng hồ. Giả sử chúng ta đã lưu trữ `PlainDateTime` có nội dung "2024-03-10T02:05:00", và chúng ta muốn diễn giải nó trong múi giờ `America/New_York`, sẽ không có thời gian nào tương ứng với nó, trong khi `PlainDateTime` có nội dung "2024-11-03T01:05:00" có thể tương ứng với hai thời điểm khác nhau.

Khi xây dựng `ZonedDateTime` từ giờ địa phương (sử dụng {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}, {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}, {{jsxref("Temporal/PlainDateTime/toZonedDateTime", "Temporal.PlainDateTime.prototype.toZonedDateTime()")}}), hành vi đối với sự mơ hồ và khoảng trống có thể cấu hình thông qua tùy chọn `disambiguation`:

- `earlier`
  - : Nếu có hai thời điểm có thể, hãy chọn thời điểm sớm hơn. Nếu có khoảng trống, hãy lùi lại theo thời gian khoảng trống.
- `later`
  - : Nếu có hai thời điểm có thể, hãy chọn thời điểm muộn hơn. Nếu có khoảng trống, hãy tiến lên theo thời gian khoảng trống.
- `compatible` (mặc định)
  - : Hành vi giống như {{jsxref("Date")}}: sử dụng `later` cho các khoảng trống và `earlier` cho các trường hợp mơ hồ.
- `reject`
  - : Ném `RangeError` bất cứ khi nào có sự mơ hồ hoặc khoảng trống.

Có một số trường hợp không có sự mơ hồ khi xây dựng `ZonedDateTime`:

- Nếu thời gian được chỉ định theo UTC thông qua offset `Z`.
- Nếu offset được cung cấp rõ ràng và được sử dụng (xem bên dưới).

### Sự mơ hồ của offset

Chúng ta đã chứng minh cách sự mơ hồ có thể phát sinh từ việc diễn giải giờ địa phương trong múi giờ mà không cung cấp offset rõ ràng. Tuy nhiên, nếu bạn cung cấp offset rõ ràng, thì một xung đột khác phát sinh: giữa offset được chỉ định và offset được tính từ múi giờ và giờ địa phương. Đây là một vấn đề thực tế không thể tránh khỏi: nếu bạn lưu trữ thời gian trong tương lai với offset được dự đoán, thì trước khi thời gian đó đến, định nghĩa múi giờ có thể đã thay đổi vì lý do chính trị. Ví dụ, giả sử vào năm 2018, chúng ta đặt lời nhắc tại thời gian `2019-12-23T12:00:00-02:00[America/Sao_Paulo]` (đây là giờ tiết kiệm ánh sáng ban ngày; Brazil ở bán cầu nam, vì vậy nó bắt đầu DST vào tháng 10 và kết thúc vào tháng 2). Nhưng trước khi thời gian đó đến, vào đầu năm 2019, Brazil quyết định ngừng tuân thủ DST, vì vậy offset thực tế trở thành `-03:00`. Lời nhắc bây giờ có nên vẫn kích hoạt vào buổi trưa (giữ giờ địa phương), hay nó nên kích hoạt lúc 11:00 SA (giữ thời gian chính xác)?

Để sự mơ hồ offset tồn tại, một chuỗi timestamp phải được phân tích bằng các quy tắc Cơ sở dữ liệu Múi giờ IANA khác với các quy tắc được sử dụng khi timestamp ban đầu được tạo ra. Điều này sẽ không bao giờ xảy ra khi timestamp được tạo ra trong cùng quá trình thực thi của chương trình JavaScript, vì thông số ECMAScript yêu cầu các quy tắc Cơ sở dữ liệu Múi giờ IANA phải nhất quán trong suốt vòng đời của một chương trình JavaScript.

Tuy nhiên, sự mơ hồ offset có thể tồn tại khi một chương trình JavaScript đang phân tích các timestamp đã được lưu trữ trước đó, như trong ví dụ `America/Sao_Paulo` ở trên, và Cơ sở dữ liệu Múi giờ IANA đã được cập nhật kể từ khi timestamp ban đầu được tạo ra. Nó cũng có thể xảy ra khi truyền thông timestamp giữa các máy tính (hoặc, hiếm khi, giữa các phần mềm khác nhau trên cùng máy tính!) sử dụng các phiên bản khác nhau của Cơ sở dữ liệu Múi giờ IANA. Cơ sở dữ liệu Múi giờ IANA cũng có các tùy chọn xây dựng (ví dụ, sử dụng hoặc không sử dụng các quy tắc không còn dùng trong `backzone`) có thể gây ra sự mơ hồ offset khi truyền thông timestamp giữa các máy tính sử dụng các phần mềm khác nhau, ngay cả khi phiên bản Cơ sở dữ liệu Múi giờ IANA là như nhau.

Sự mơ hồ offset hiếm khi gặp phải và hầu như sẽ chỉ áp dụng cho các timestamp trước năm 1970 hoặc cho các timestamp trong tương lai vài tháng hoặc vài năm. Nhưng khi vấn đề này xảy ra, `RangeError` sẽ được ném ra theo mặc định. Khi xây dựng `ZonedDateTime` với {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}} hoặc khi cập nhật nó bằng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}}, bạn có thể ngăn ngoại lệ này bằng cách sử dụng tùy chọn `offset` để quyết định liệu offset hay định danh múi giờ "thắng":

- `use`
  - : Sử dụng offset để tính thời gian chính xác. Tùy chọn này "sử dụng" offset để quyết định thời điểm mà chuỗi timestamp muốn nói, ngay cả khi offset tại thời điểm đó đã thay đổi. Định danh múi giờ vẫn được sử dụng để suy ra offset (có thể được cập nhật) và sử dụng offset đó để chuyển đổi thời gian chính xác sang giờ địa phương. Trong ví dụ `2019-12-23T12:00:00-02:00[America/Sao_Paulo]` ở trên, tùy chọn này sẽ khiến lời nhắc kích hoạt lúc 11:00 SA giờ địa phương.
- `ignore`
  - : Sử dụng định danh múi giờ để tính toán lại offset, bỏ qua offset được chỉ định trong chuỗi. Tùy chọn này giữ nguyên giờ địa phương như ban đầu được tính khi chúng ta lưu trữ thời gian, nhưng có thể dẫn đến một thời điểm khác. Lưu ý rằng bằng cách bỏ qua offset, cùng [sự mơ hồ diễn giải giờ địa phương](#ambiguity_and_gaps_from_local_time_to_utc_time) có thể phát sinh, được giải quyết bằng tùy chọn `disambiguation`. Trong ví dụ `2019-12-23T12:00:00-02:00[America/Sao_Paulo]` ở trên, tùy chọn này sẽ khiến lời nhắc kích hoạt lúc 12:00 PM giờ địa phương.
- `reject`
  - : Ném `RangeError` bất cứ khi nào có xung đột giữa offset và định danh múi giờ. Đây là mặc định cho {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}.
- `prefer`
  - : Sử dụng offset nếu nó hợp lệ, nếu không thì tính toán offset từ định danh múi giờ. Đây là mặc định cho {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}} (xem phương thức đó để biết thêm chi tiết). Điều này khác với `ignore` vì trong trường hợp mơ hồ giờ địa phương, offset được sử dụng để giải quyết nó thay vì tùy chọn `disambiguation`.

Nếu bạn biết trước cách bạn muốn xử lý sự mơ hồ offset, hãy xem xét sử dụng tùy chọn `offset` để tránh các ngoại lệ được ném ra theo mặc định. Ví dụ, một ứng dụng lịch có thể muốn định danh múi giờ "thắng" để các cuộc họp định kỳ được hiển thị theo giờ địa phương được cập nhật nhất cho múi giờ đó, vì vậy `offset: "ignore"` là thích hợp. Mặt khác, một ứng dụng lên lịch tác vụ thực thi một tác vụ đúng 3 giờ từ bây giờ có lẽ nên chọn `offset: "use"` vì các thay đổi về quy tắc múi giờ không nên thay đổi ý nghĩa của "3 giờ từ bây giờ".

Trong một số trường hợp, bạn có thể không biết tùy chọn `offset` nào là đúng mà không cần nhận đầu vào từ người dùng. Trong những trường hợp này, bạn có thể muốn bắt `RangeError` và sau đó hỏi người dùng giờ địa phương nào là đúng, rồi thử phân tích lại bằng tùy chọn `offset` khác tương ứng với lựa chọn của người dùng.

Lưu ý rằng offset `Z` không tương đương với `+00:00`. Offset `Z` có nghĩa là "thời gian theo UTC được biết, nhưng offset sang giờ địa phương là không biết", theo [RFC 9557](https://www.rfc-editor.org/rfc/rfc9557.html#name-update-to-rfc-3339). Khi chuỗi thời gian sử dụng offset `Z`, tùy chọn `offset` bị bỏ qua, và offset được suy ra từ ID múi giờ. Mặt khác, offset `+00:00` được diễn giải là offset giờ địa phương tình cờ khớp với UTC và được xác thực dựa trên ID múi giờ.

> [!NOTE]
> Mặc dù {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}} cũng nhận chuỗi [RFC 9557](#rfc_9557_format) theo cùng dạng, không có sự mơ hồ vì nó luôn bỏ qua định danh múi giờ và chỉ đọc offset.

## Constructor

- {{jsxref("Temporal/ZonedDateTime/ZonedDateTime", "Temporal.ZonedDateTime()")}} {{experimental_inline}}
  - : Tạo một đối tượng `Temporal.ZonedDateTime` mới bằng cách cung cấp trực tiếp dữ liệu nền.

## Phương thức static

- {{jsxref("Temporal/ZonedDateTime/compare", "Temporal.ZonedDateTime.compare()")}}
  - : Trả về một số (-1, 0 hoặc 1) cho biết ngày-giờ đầu tiên đến trước, bằng, hay sau ngày-giờ thứ hai. Tương đương với việc so sánh {{jsxref("Temporal/ZonedDateTime/epochNanoseconds", "epochNanoseconds")}} của hai ngày-giờ.
- {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}
  - : Tạo một đối tượng `Temporal.ZonedDateTime` mới từ một đối tượng `Temporal.ZonedDateTime` khác, một đối tượng có các thuộc tính ngày, giờ và múi giờ, hoặc một chuỗi [RFC 9557](#rfc_9557_format).

## Thuộc tính thực thể

Các thuộc tính này được định nghĩa trên `Temporal.ZonedDateTime.prototype` và được chia sẻ bởi tất cả các thực thể `Temporal.ZonedDateTime`.

- {{jsxref("Temporal/ZonedDateTime/calendarId", "Temporal.ZonedDateTime.prototype.calendarId")}}
  - : Trả về một chuỗi biểu thị [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được sử dụng để diễn giải ngày ISO 8601 nội bộ.
- {{jsxref("Object/constructor", "Temporal.ZonedDateTime.prototype.constructor")}}
  - : Hàm constructor tạo ra đối tượng thực thể. Đối với các thực thể `Temporal.ZonedDateTime`, giá trị ban đầu là constructor {{jsxref("Temporal/ZonedDateTime/ZonedDateTime", "Temporal.ZonedDateTime()")}}.
- {{jsxref("Temporal/ZonedDateTime/day", "Temporal.ZonedDateTime.prototype.day")}}
  - : Trả về một số nguyên dương biểu thị chỉ số ngày (tính từ 1) trong tháng của ngày này, là cùng số ngày bạn thấy trên lịch. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường bắt đầu từ 1 và liên tục, nhưng không phải luôn luôn.
- {{jsxref("Temporal/ZonedDateTime/dayOfWeek", "Temporal.ZonedDateTime.prototype.dayOfWeek")}}
  - : Trả về một số nguyên dương biểu thị chỉ số ngày (tính từ 1) trong tuần của ngày này. Các ngày trong tuần được đánh số tuần tự từ `1` đến {{jsxref("Temporal/ZonedDateTime/daysInWeek", "daysInWeek")}}, với mỗi số ánh xạ đến tên của nó. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). 1 thường biểu thị Thứ Hai trong lịch, ngay cả khi các ngôn ngữ sử dụng lịch có thể coi một ngày khác là ngày đầu tiên của tuần (xem {{jsxref("Intl/Locale/getWeekInfo", "Intl.Locale.prototype.getWeekInfo()")}}).
- {{jsxref("Temporal/ZonedDateTime/dayOfYear", "Temporal.ZonedDateTime.prototype.dayOfYear")}}
  - : Trả về một số nguyên dương biểu thị chỉ số ngày (tính từ 1) trong năm của ngày này. Ngày đầu tiên của năm là `1`, và ngày cuối cùng là {{jsxref("Temporal/ZonedDateTime/daysInYear", "daysInYear")}}. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/ZonedDateTime/daysInMonth", "Temporal.ZonedDateTime.prototype.daysInMonth")}}
  - : Trả về một số nguyên dương biểu thị số ngày trong tháng của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/ZonedDateTime/daysInWeek", "Temporal.ZonedDateTime.prototype.daysInWeek")}}
  - : Trả về một số nguyên dương biểu thị số ngày trong tuần của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, giá trị này luôn là 7, nhưng trong các hệ thống lịch khác nó có thể khác nhau từ tuần này sang tuần khác.
- {{jsxref("Temporal/ZonedDateTime/daysInYear", "Temporal.ZonedDateTime.prototype.daysInYear")}}
  - : Trả về một số nguyên dương biểu thị số ngày trong năm của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, giá trị này là 365, hoặc 366 trong năm nhuận.
- {{jsxref("Temporal/ZonedDateTime/epochMilliseconds", "Temporal.ZonedDateTime.prototype.epochMilliseconds")}}
  - : Trả về một số nguyên biểu thị số mili giây đã trôi qua kể từ Unix epoch (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC) đến thời điểm này. Tương đương với việc chia `epochNanoseconds` cho `1e6` và lấy phần nguyên của kết quả.
- {{jsxref("Temporal/ZonedDateTime/epochNanoseconds", "Temporal.ZonedDateTime.prototype.epochNanoseconds")}}
  - : Trả về một {{jsxref("BigInt")}} biểu thị số nano giây đã trôi qua kể từ Unix epoch (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC) đến thời điểm này.
- {{jsxref("Temporal/ZonedDateTime/era", "Temporal.ZonedDateTime.prototype.era")}}
  - : Trả về một chuỗi chữ thường đặc thù theo lịch biểu thị kỷ nguyên của ngày này, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ, ISO 8601). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, giống như cách `year` làm. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với Gregorian, giá trị là `"ce"` hoặc `"bce"`.
- {{jsxref("Temporal/ZonedDateTime/eraYear", "Temporal.ZonedDateTime.prototype.eraYear")}}
  - : Trả về một số nguyên không âm biểu thị năm của ngày này trong kỷ nguyên, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ, ISO 8601). Chỉ số năm thường bắt đầu từ 1 (phổ biến hơn) hoặc 0, và các năm trong một kỷ nguyên có thể giảm theo thời gian (ví dụ, BCE Gregorian). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, giống như cách `year` làm. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/ZonedDateTime/hour", "Temporal.ZonedDateTime.prototype.hour")}}
  - : Trả về một số nguyên từ 0 đến 23 biểu thị thành phần giờ của thời gian này.
- {{jsxref("Temporal/ZonedDateTime/hoursInDay", "Temporal.ZonedDateTime.prototype.hoursInDay")}}
  - : Trả về một số nguyên dương biểu thị số giờ trong ngày của ngày này trong múi giờ. Nó có thể nhiều hơn hoặc ít hơn 24 trong trường hợp thay đổi offset như giờ tiết kiệm ánh sáng ban ngày.
- {{jsxref("Temporal/ZonedDateTime/inLeapYear", "Temporal.ZonedDateTime.prototype.inLeapYear")}}
  - : Trả về một boolean cho biết liệu ngày này có nằm trong năm nhuận hay không. Năm nhuận là năm có nhiều ngày hơn (do ngày nhuận hoặc tháng nhuận) so với năm thường. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).
- {{jsxref("Temporal/ZonedDateTime/microsecond", "Temporal.ZonedDateTime.prototype.microsecond")}}
  - : Trả về một số nguyên từ 0 đến 999 biểu thị thành phần micro giây (10<sup>-6</sup> giây) của thời gian này.
- {{jsxref("Temporal/ZonedDateTime/millisecond", "Temporal.ZonedDateTime.prototype.millisecond")}}
  - : Trả về một số nguyên từ 0 đến 999 biểu thị thành phần mili giây (10<sup>-3</sup> giây) của thời gian này.
- {{jsxref("Temporal/ZonedDateTime/minute", "Temporal.ZonedDateTime.prototype.minute")}}
  - : Trả về một số nguyên từ 0 đến 59 biểu thị thành phần phút của thời gian này.
- {{jsxref("Temporal/ZonedDateTime/month", "Temporal.ZonedDateTime.prototype.month")}}
  - : Trả về một số nguyên dương biểu thị chỉ số tháng (tính từ 1) trong năm của ngày này. Tháng đầu tiên của năm là `1`, và tháng cuối cùng là {{jsxref("Temporal/ZonedDateTime/monthsInYear", "monthsInYear")}}. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Lưu ý rằng không giống như {{jsxref("Date.prototype.getMonth()")}}, chỉ số này tính từ 1. Nếu lịch có tháng nhuận, thì tháng có cùng {{jsxref("Temporal/ZonedDateTime/monthCode", "monthCode")}} có thể có chỉ số `month` khác nhau cho các năm khác nhau.
- {{jsxref("Temporal/ZonedDateTime/monthCode", "Temporal.ZonedDateTime.prototype.monthCode")}}
  - : Trả về một chuỗi đặc thù theo lịch biểu thị tháng của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường là `M` cộng với số tháng có hai chữ số. Đối với các tháng nhuận, nó là mã của tháng trước đó theo sau là `L`. Nếu tháng nhuận là tháng đầu tiên của năm, mã là `M00L`.
- {{jsxref("Temporal/ZonedDateTime/monthsInYear", "Temporal.ZonedDateTime.prototype.monthsInYear")}}
  - : Trả về một số nguyên dương biểu thị số tháng trong năm của ngày này. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với lịch ISO 8601, giá trị này luôn là 12, nhưng trong các hệ thống lịch khác nó có thể khác nhau.
- {{jsxref("Temporal/ZonedDateTime/nanosecond", "Temporal.ZonedDateTime.prototype.nanosecond")}}
  - : Trả về một số nguyên từ 0 đến 999 biểu thị thành phần nano giây (10<sup>-9</sup> giây) của thời gian này.
- {{jsxref("Temporal/ZonedDateTime/offset", "Temporal.ZonedDateTime.prototype.offset")}}
  - : Trả về một chuỗi biểu thị [offset](#time_zones_and_offsets) được sử dụng để diễn giải thời điểm nội bộ, ở dạng `±HH:mm` (hoặc `±HH:mm:ss.sssssssss` với độ chính xác dưới phút cần thiết).
- {{jsxref("Temporal/ZonedDateTime/offsetNanoseconds", "Temporal.ZonedDateTime.prototype.offsetNanoseconds")}}
  - : Trả về một số nguyên biểu thị [offset](#time_zones_and_offsets) được sử dụng để diễn giải thời điểm nội bộ, như số nano giây (dương hoặc âm).
- {{jsxref("Temporal/ZonedDateTime/second", "Temporal.ZonedDateTime.prototype.second")}}
  - : Trả về một số nguyên từ 0 đến 59 biểu thị thành phần giây của thời gian này.
- {{jsxref("Temporal/ZonedDateTime/timeZoneId", "Temporal.ZonedDateTime.prototype.timeZoneId")}}
  - : Trả về một chuỗi biểu thị [định danh múi giờ](#time_zones_and_offsets) được sử dụng để diễn giải thời điểm nội bộ. Nó sử dụng cùng chuỗi được sử dụng khi xây dựng đối tượng `Temporal.ZonedDateTime`, là tên múi giờ IANA hoặc offset cố định.
- {{jsxref("Temporal/ZonedDateTime/weekOfYear", "Temporal.ZonedDateTime.prototype.weekOfYear")}}
  - : Trả về một số nguyên dương biểu thị chỉ số tuần (tính từ 1) trong {{jsxref("Temporal/ZonedDateTime/yearOfWeek", "yearOfWeek")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được xác định rõ ràng. Tuần đầu tiên của năm là `1`. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Lưu ý rằng đối với ISO 8601, một vài ngày đầu tiên và cuối cùng của năm có thể được quy cho tuần cuối cùng của năm trước hoặc tuần đầu tiên của năm tiếp theo.
- {{jsxref("Temporal/ZonedDateTime/year", "Temporal.ZonedDateTime.prototype.year")}}
  - : Trả về một số nguyên biểu thị số năm của ngày này so với năm epoch đặc thù theo lịch. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường năm 1 là năm đầu tiên của kỷ nguyên mới nhất hoặc năm ISO 8601 `0001`. Nếu epoch ở giữa năm, năm đó sẽ có cùng giá trị trước và sau ngày bắt đầu của kỷ nguyên.
- {{jsxref("Temporal/ZonedDateTime/yearOfWeek", "Temporal.ZonedDateTime.prototype.yearOfWeek")}}
  - : Trả về một số nguyên biểu thị năm cần ghép với {{jsxref("Temporal/ZonedDateTime/weekOfYear", "weekOfYear")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được xác định rõ ràng. Phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Thường đây là năm của ngày, nhưng đối với ISO 8601, một vài ngày đầu tiên và cuối cùng của năm có thể được quy cho tuần cuối cùng của năm trước hoặc tuần đầu tiên của năm tiếp theo, khiến `yearOfWeek` khác 1.
- `Temporal.ZonedDateTime.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal.ZonedDateTime"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức thực thể

- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
  - : Trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này được dịch tiến theo một khoảng thời gian đã cho (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/ZonedDateTime/equals", "Temporal.ZonedDateTime.prototype.equals()")}}
  - : Trả về `true` nếu ngày-giờ này có giá trị tương đương với một ngày-giờ khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}), và `false` nếu không. Chúng được so sánh theo cả giá trị thời điểm, múi giờ và lịch của chúng, vì vậy hai ngày-giờ từ các lịch hoặc múi giờ khác nhau có thể được coi là bằng nhau bởi {{jsxref("Temporal/ZonedDateTime/compare", "Temporal.ZonedDateTime.compare()")}} nhưng không bởi `equals()`.
- {{jsxref("Temporal/ZonedDateTime/getTimeZoneTransition", "Temporal.ZonedDateTime.prototype.getTimeZoneTransition()")}}
  - : Trả về một đối tượng `Temporal.ZonedDateTime` biểu thị thời điểm đầu tiên sau hoặc trước thời điểm này mà tại đó offset UTC của múi giờ thay đổi, hoặc `null` nếu không có sự chuyển đổi như vậy. Điều này hữu ích để tìm hiểu các quy tắc offset của múi giờ, chẳng hạn như mẫu giờ tiết kiệm ánh sáng ban ngày của nó.
- {{jsxref("Temporal/ZonedDateTime/round", "Temporal.ZonedDateTime.prototype.round()")}}
  - : Trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này được làm tròn đến đơn vị đã cho.
- {{jsxref("Temporal/ZonedDateTime/since", "Temporal.ZonedDateTime.prototype.since()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu thị khoảng thời gian từ một ngày-giờ khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}) đến ngày-giờ này. Khoảng thời gian là dương nếu ngày-giờ kia trước ngày-giờ này, và âm nếu sau.
- {{jsxref("Temporal/ZonedDateTime/startOfDay", "Temporal.ZonedDateTime.prototype.startOfDay()")}}
  - : Trả về một đối tượng `Temporal.ZonedDateTime` biểu thị thời điểm đầu tiên của ngày này trong múi giờ. Thông thường nó có giờ là `00:00:00`, nhưng có thể khác nếu nửa đêm không tồn tại do thay đổi offset, trong trường hợp đó thời điểm đầu tiên tồn tại được trả về.
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
  - : Trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này được dịch lùi theo một khoảng thời gian đã cho (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).
- {{jsxref("Temporal/ZonedDateTime/toInstant", "Temporal.ZonedDateTime.prototype.toInstant()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Instant")}} mới biểu thị thời điểm của ngày-giờ này.
- {{jsxref("Temporal/ZonedDateTime/toJSON", "Temporal.ZonedDateTime.prototype.toJSON()")}}
  - : Trả về một chuỗi biểu thị ngày-giờ này theo cùng [định dạng RFC 9557](#rfc_9557_format) như khi gọi {{jsxref("Temporal/ZonedDateTime/toString", "toString()")}}. Được thiết kế để được gọi ngầm bởi {{jsxref("JSON.stringify()")}}.
- {{jsxref("Temporal/ZonedDateTime/toLocaleString", "Temporal.ZonedDateTime.prototype.toLocaleString()")}}
  - : Trả về một chuỗi với biểu diễn nhạy cảm ngôn ngữ của ngày-giờ này.
- {{jsxref("Temporal/ZonedDateTime/toPlainDate", "Temporal.ZonedDateTime.prototype.toPlainDate()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainDate")}} mới biểu thị phần ngày của ngày-giờ này.
- {{jsxref("Temporal/ZonedDateTime/toPlainDateTime", "Temporal.ZonedDateTime.prototype.toPlainDateTime()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainDateTime")}} mới biểu thị phần ngày và giờ của ngày-giờ này. Chỉ thông tin múi giờ bị xóa.
- {{jsxref("Temporal/ZonedDateTime/toPlainTime", "Temporal.ZonedDateTime.prototype.toPlainTime()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.PlainTime")}} mới biểu thị phần thời gian của ngày-giờ này.
- {{jsxref("Temporal/ZonedDateTime/toString", "Temporal.ZonedDateTime.prototype.toString()")}}
  - : Trả về một chuỗi biểu thị ngày-giờ này theo [định dạng RFC 9557](#rfc_9557_format).
- {{jsxref("Temporal/ZonedDateTime/until", "Temporal.ZonedDateTime.prototype.until()")}}
  - : Trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu thị khoảng thời gian từ ngày-giờ này đến một ngày-giờ khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}). Khoảng thời gian là dương nếu ngày-giờ kia sau ngày-giờ này, và âm nếu trước.
- {{jsxref("Temporal/ZonedDateTime/valueOf", "Temporal.ZonedDateTime.prototype.valueOf()")}}
  - : Ném ra {{jsxref("TypeError")}}, ngăn các thực thể `Temporal.ZonedDateTime` bị [chuyển đổi ngầm sang kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép toán số học hoặc so sánh.
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
  - : Trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này với một số trường được thay thế bằng các giá trị mới.
- {{jsxref("Temporal/ZonedDateTime/withCalendar", "Temporal.ZonedDateTime.prototype.withCalendar()")}}
  - : Trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này được diễn giải trong hệ thống lịch mới.
- {{jsxref("Temporal/ZonedDateTime/withPlainTime", "Temporal.ZonedDateTime.prototype.withPlainTime()")}}
  - : Trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này với phần thời gian được thay thế hoàn toàn bởi thời gian mới (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}})
- {{jsxref("Temporal/ZonedDateTime/withTimeZone", "Temporal.ZonedDateTime.prototype.withTimeZone()")}}
  - : Trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị cùng thời điểm như ngày-giờ này nhưng trong múi giờ mới.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.PlainTime")}}
