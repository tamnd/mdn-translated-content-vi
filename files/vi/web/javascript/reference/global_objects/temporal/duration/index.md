---
title: Temporal.Duration
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration
page-type: javascript-class
browser-compat: javascript.builtins.Temporal.Duration
sidebar: jsref
---

Đối tượng **`Temporal.Duration`** đại diện cho sự khác biệt giữa hai thời điểm, có thể được sử dụng trong các phép tính số học ngày/giờ. Về cơ bản, nó được biểu diễn như một tổ hợp của các giá trị năm, tháng, tuần, ngày, giờ, phút, giây, mili giây, micro giây và nano giây.

## Mô tả

### Định dạng duration ISO 8601

Các đối tượng `Duration` có thể được tuần tự hóa và phân tích cú pháp bằng cách sử dụng [định dạng duration ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Durations) (với một số phần mở rộng được chỉ định bởi ECMAScript). Chuỗi có dạng sau (khoảng trắng chỉ để dễ đọc và không nên có trong chuỗi thực tế):

```plain
±P nY nM nW nD T nH nM nS
```

- `±` {{optional_inline}}
  - : Ký tự dấu tùy chọn (`+` hoặc `-`), đại diện cho duration dương hoặc âm. Mặc định là dương.
- `P`
  - : Ký tự chữ `P` hoặc `p` đại diện cho "period" (khoảng thời gian).
- `nY`, `nM`, `nW`, `nD`, `nH`, `nM`, `nS`
  - : Một số theo sau bởi một ký tự chữ, đại diện cho số năm (`Y`), tháng (`M`), tuần (`W`), ngày (`D`), giờ (`H`), phút (`M`) hoặc giây (`S`) tương ứng. Tất cả ngoại trừ thành phần cuối cùng phải là số nguyên. Thành phần cuối cùng, nếu là thành phần thời gian (giờ, phút hoặc giây), có thể có phần thập phân từ 1 đến 9 chữ số, được dẫn đầu bởi dấu chấm hoặc dấu phẩy, chẳng hạn như `PT0.0021S` hoặc `PT1.1H`. Bất kỳ thành phần nào có giá trị bằng không đều có thể được bỏ qua, nhưng ít nhất một thành phần phải có mặt (ngay cả khi có giá trị bằng không, trong trường hợp đó duration là không).
- `T`
  - : Ký tự chữ `T` hoặc `t` phân tách phần ngày với phần giờ, nên có mặt khi và chỉ khi có ít nhất một thành phần sau nó.

Dưới đây là một số ví dụ:

| ISO 8601           | Ý nghĩa                                                        |
| ------------------ | -------------------------------------------------------------- |
| `P1Y1M1DT1H1M1.1S` | 1 năm, 1 tháng, 1 ngày, 1 giờ, 1 phút, 1 giây và 100 mili giây |
| `P40D`             | 40 ngày                                                        |
| `P1Y1D`            | 1 năm và 1 ngày                                                |
| `P3DT4H59M`        | 3 ngày, 4 giờ và 59 phút                                       |
| `PT2H30M`          | 2 giờ và 30 phút                                               |
| `P1M`              | 1 tháng                                                        |
| `PT1M`             | 1 phút                                                         |
| `PT0.0021S`        | 2,1 mili giây (2 mili giây và 100 micro giây)                  |
| `PT0S`             | Không (biểu diễn chuẩn)                                        |
| `P0D`              | Không                                                          |

> [!NOTE]
> Theo tiêu chuẩn ISO 8601-1, các tuần không được phép xuất hiện cùng với bất kỳ đơn vị nào khác, và các duration chỉ có thể là dương. Là các phần mở rộng của tiêu chuẩn, ISO 8601-2 mà Temporal sử dụng cho phép ký tự dấu ở đầu chuỗi và cho phép kết hợp tuần với các đơn vị khác. Do đó, nếu duration của bạn được tuần tự hóa thành chuỗi như `P3W1D`, `+P1M` hoặc `-P1M`, hãy lưu ý rằng các chương trình khác có thể không chấp nhận nó.

Khi tuần tự hóa, đầu ra tôn trọng các thành phần được lưu trữ nhiều nhất có thể, bảo tồn các thành phần [chưa cân bằng](#cân_bằng_duration). Tuy nhiên, các thành phần dưới giây được tuần tự hóa thành một giây thập phân duy nhất, vì vậy các giá trị chính xác của chúng, nếu chưa cân bằng, có thể bị mất. Dấu cộng được bỏ qua cho các duration dương. Duration bằng không luôn được tuần tự hóa thành `PT0S`.

### Duration lịch

_Duration lịch_ là duration có chứa bất kỳ đơn vị [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) nào: tuần, tháng và năm. Duration không lịch có thể di chuyển được và có thể tham gia vào các phép tính số học ngày/giờ mà không cần bất kỳ thông tin lịch nào, vì chúng biểu diễn một lượng thời gian cố định rõ ràng. Tuy nhiên, duration lịch không thể di chuyển được vì số ngày trong một tháng hoặc năm phụ thuộc vào hệ thống lịch và điểm thời gian tham chiếu. Do đó, cố gắng thực hiện bất kỳ phép tính nào trên duration lịch sẽ ném ra lỗi vì các duration không tự theo dõi lịch. Ví dụ, nếu chúng ta đang ở tháng 5 của lịch Gregorian, thì "1 tháng" là "31 ngày", nhưng nếu chúng ta đang ở tháng 4, thì "1 tháng" trở thành "30 ngày". Để cộng hoặc trừ duration lịch, bạn cần thêm chúng vào các ngày tháng thay thế:

```js
const dur1 = Temporal.Duration.from({ years: 1 });
const dur2 = Temporal.Duration.from({ months: 1 });

dur1.add(dur2); // RangeError: for calendar duration arithmetic, use date arithmetic relative to a starting point

const startingPoint = Temporal.PlainDate.from("2021-01-01"); // ISO 8601 calendar
startingPoint.add(dur1).add(dur2).since(startingPoint); // "P396D"
```

Các phép tính khác, `round()`, `total()` và `compare()`, nhận tùy chọn `relativeTo` để cung cấp thông tin lịch và thời gian tham chiếu cần thiết. Tùy chọn này có thể là {{jsxref("Temporal.PlainDate")}}, {{jsxref("Temporal.PlainDateTime")}}, {{jsxref("Temporal.ZonedDateTime")}}, hoặc đối tượng hay chuỗi có thể chuyển đổi bằng {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}} (nếu tùy chọn `timeZone` được cung cấp hoặc chuỗi chứa chú thích múi giờ) hoặc {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}.

Lưu ý rằng việc chuyển đổi `days` sang `hours` cũng mơ hồ về mặt kỹ thuật vì độ dài của một ngày có thể thay đổi do thay đổi offset, chẳng hạn như giờ mùa hè. Bạn có thể cung cấp `relativeTo` có múi giờ để tính đến những thay đổi này; nếu không, ngày 24 giờ được giả định.

### Cân bằng duration

Có nhiều cách để biểu diễn cùng một duration: ví dụ, "1 phút và 30 giây" và "90 giây" là tương đương. Tuy nhiên, tùy thuộc vào ngữ cảnh, một biểu diễn có thể phù hợp hơn biểu diễn kia. Do đó, nói chung, đối tượng `Duration` bảo tồn các giá trị đầu vào nhiều nhất có thể, để khi bạn định dạng nó, nó sẽ được hiển thị như bạn mong đợi.

Mỗi thành phần của duration có phạm vi tối ưu của nó; giờ nên từ 0 đến 23, phút từ 0 đến 59, v.v. Khi một thành phần vượt quá phạm vi tối ưu của nó, phần dư có thể được "mang" vào thành phần lớn hơn tiếp theo. Để mang, chúng ta cần trả lời câu hỏi "bao nhiêu X trong một Y?", đây là câu hỏi phức tạp cho [đơn vị lịch](#duration_lịch), vì vậy trong trường hợp này cần có lịch. Cũng lưu ý rằng theo mặc định, `days` được mang trực tiếp vào `months`; đơn vị tuần chỉ được mang vào nếu được yêu cầu rõ ràng. Nếu chúng ta mang nhiều nhất có thể, kết quả cuối cùng trong đó tất cả các thành phần đều nằm trong phạm vi tối ưu của chúng được gọi là duration "cân bằng". Các duration chưa cân bằng thường có dạng "nặng đầu", trong đó đơn vị lớn nhất không cân bằng (ví dụ: "27 giờ và 30 phút"); các dạng khác, chẳng hạn như "23 giờ và 270 phút", hiếm khi được thấy.

Phương thức {{jsxref("Temporal/Duration/round", "round()")}} luôn cân bằng duration thành dạng "nặng đầu", lên đến tùy chọn `largestUnit`. Với tùy chọn `largestUnit` thủ công đủ lớn, bạn có thể cân bằng hoàn toàn duration. Tương tự, các phương thức {{jsxref("Temporal/Duration/add", "add()")}} và {{jsxref("Temporal/Duration/subtract", "subtract()")}} cân bằng duration kết quả thành đơn vị lớn nhất của các duration đầu vào.

Lưu ý rằng vì định dạng duration ISO 8601 biểu diễn các thành phần dưới giây thành một số phân số duy nhất, nên không thể bảo tồn các thành phần dưới giây chưa cân bằng trong quá trình tuần tự hóa bằng định dạng mặc định. Ví dụ, "1000 mili giây" được tuần tự hóa thành `"PT1S"`, và sau đó được giải tuần tự hóa thành "1 giây". Nếu bạn cần bảo tồn độ lớn của các thành phần dưới giây, bạn cần tuần tự hóa thủ công như một đối tượng JSON thay thế (vì theo mặc định phương thức {{jsxref("Temporal/Duration/toJSON", "toJSON()")}} tuần tự hóa duration theo định dạng ISO 8601).

### Dấu duration

Vì duration là sự khác biệt giữa hai thời điểm, nó có thể là dương, âm hoặc bằng không. Ví dụ, nếu bạn đang hiển thị thời gian sự kiện theo thời gian tương đối, thì các duration âm có thể đại diện cho các sự kiện trong quá khứ, và các duration dương cho tương lai. Trong biểu diễn của chúng tôi sử dụng tổ hợp các thành phần thời gian, dấu được lưu trữ trong mỗi thành phần: duration âm luôn có tất cả các thành phần âm (hoặc bằng không), và duration dương luôn có tất cả các thành phần dương (hoặc bằng không). Xây dựng duration với các thành phần có dấu hỗn hợp là không hợp lệ và sẽ bị từ chối bởi constructor hoặc phương thức {{jsxref("Temporal/Duration/with", "with()")}}. Các phương thức `add()` và `subtract()` sẽ cân bằng duration kết quả để tránh dấu hỗn hợp.

## Constructor

- {{jsxref("Temporal/Duration/Duration", "Temporal.Duration()")}}
  - : Tạo một đối tượng `Temporal.Duration` mới bằng cách cung cấp trực tiếp dữ liệu cơ bản.

## Phương thức tĩnh

- {{jsxref("Temporal/Duration/compare", "Temporal.Duration.compare()")}}
  - : Trả về một số (-1, 0 hoặc 1) cho biết duration đầu tiên ngắn hơn, bằng hay dài hơn duration thứ hai.
- {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}
  - : Tạo một đối tượng `Temporal.Duration` mới từ một đối tượng `Temporal.Duration` khác, một đối tượng có các thuộc tính duration, hoặc một chuỗi ISO 8601.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Temporal.Duration.prototype` và được chia sẻ bởi tất cả các instance `Temporal.Duration`.

- {{jsxref("Temporal/Duration/blank", "Temporal.Duration.prototype.blank")}}
  - : Trả về một boolean là `true` nếu duration này đại diện cho duration bằng không, và `false` nếu không. Tương đương với `duration.sign === 0`.
- {{jsxref("Object/constructor", "Temporal.Duration.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `Temporal.Duration`, giá trị ban đầu là constructor {{jsxref("Temporal/Duration/Duration", "Temporal.Duration()")}}.
- {{jsxref("Temporal/Duration/days", "Temporal.Duration.prototype.days")}}
  - : Trả về một số nguyên đại diện cho số ngày trong duration.
- {{jsxref("Temporal/Duration/hours", "Temporal.Duration.prototype.hours")}}
  - : Trả về một số nguyên đại diện cho số giờ trong duration.
- {{jsxref("Temporal/Duration/microseconds", "Temporal.Duration.prototype.microseconds")}}
  - : Trả về một số nguyên đại diện cho số micro giây trong duration.
- {{jsxref("Temporal/Duration/milliseconds", "Temporal.Duration.prototype.milliseconds")}}
  - : Trả về một số nguyên đại diện cho số mili giây trong duration.
- {{jsxref("Temporal/Duration/minutes", "Temporal.Duration.prototype.minutes")}}
  - : Trả về một số nguyên đại diện cho số phút trong duration.
- {{jsxref("Temporal/Duration/months", "Temporal.Duration.prototype.months")}}
  - : Trả về một số nguyên đại diện cho số tháng trong duration.
- {{jsxref("Temporal/Duration/nanoseconds", "Temporal.Duration.prototype.nanoseconds")}}
  - : Trả về một số nguyên đại diện cho số nano giây trong duration.
- {{jsxref("Temporal/Duration/seconds", "Temporal.Duration.prototype.seconds")}}
  - : Trả về một số nguyên đại diện cho số giây trong duration.
- {{jsxref("Temporal/Duration/sign", "Temporal.Duration.prototype.sign")}}
  - : Trả về `1` nếu duration này là dương, `-1` nếu âm và `0` nếu bằng không.
- {{jsxref("Temporal/Duration/weeks", "Temporal.Duration.prototype.weeks")}}
  - : Trả về một số nguyên đại diện cho số tuần trong duration.
- {{jsxref("Temporal/Duration/years", "Temporal.Duration.prototype.years")}}
  - : Trả về một số nguyên đại diện cho số năm trong duration.
- `Temporal.Duration.prototype[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal.Duration"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Temporal/Duration/abs", "Temporal.Duration.prototype.abs()")}}
  - : Trả về một đối tượng `Temporal.Duration` mới với giá trị tuyệt đối của duration này (tất cả các trường giữ nguyên độ lớn, nhưng dấu trở thành dương).
- {{jsxref("Temporal/Duration/add", "Temporal.Duration.prototype.add()")}}
  - : Trả về một đối tượng `Temporal.Duration` mới với tổng của duration này và một duration đã cho (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}). Kết quả được [cân bằng](#cân_bằng_duration).
- {{jsxref("Temporal/Duration/negated", "Temporal.Duration.prototype.negated()")}}
  - : Trả về một đối tượng `Temporal.Duration` mới với giá trị phủ định của duration này (tất cả các trường giữ nguyên độ lớn, nhưng dấu bị đảo ngược).
- {{jsxref("Temporal/Duration/round", "Temporal.Duration.prototype.round()")}}
  - : Trả về một đối tượng `Temporal.Duration` mới với duration được làm tròn đến đơn vị nhỏ nhất đã cho và/hoặc [cân bằng](#cân_bằng_duration) đến đơn vị lớn nhất đã cho.
- {{jsxref("Temporal/Duration/subtract", "Temporal.Duration.prototype.subtract()")}}
  - : Trả về một đối tượng `Temporal.Duration` mới với sự khác biệt giữa duration này và một duration đã cho (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}). Tương đương với [cộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/add) giá trị [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của duration kia.
- {{jsxref("Temporal/Duration/toJSON", "Temporal.Duration.prototype.toJSON()")}}
  - : Trả về một chuỗi đại diện cho duration này theo [định dạng ISO 8601](#định_dạng_duration_iso_8601) giống như khi gọi {{jsxref("Temporal/Duration/toString", "toString()")}}. Được thiết kế để được gọi ngầm định bởi {{jsxref("JSON.stringify()")}}.
- {{jsxref("Temporal/Duration/toLocaleString", "Temporal.Duration.prototype.toLocaleString()")}}
  - : Trả về một chuỗi với biểu diễn nhạy cảm với ngôn ngữ của duration này. Trong các triển khai có hỗ trợ [API `Intl.DurationFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat), phương thức này ủy quyền cho `Intl.DurationFormat`.
- {{jsxref("Temporal/Duration/toString", "Temporal.Duration.prototype.toString()")}}
  - : Trả về một chuỗi đại diện cho duration này theo [định dạng ISO 8601](#định_dạng_duration_iso_8601).
- {{jsxref("Temporal/Duration/total", "Temporal.Duration.prototype.total()")}}
  - : Trả về một số đại diện cho tổng duration theo đơn vị đã cho.
- {{jsxref("Temporal/Duration/valueOf", "Temporal.Duration.prototype.valueOf()")}}
  - : Ném ra một {{jsxref("TypeError")}}, ngăn các instance `Temporal.Duration` bị [chuyển đổi ngầm định thành primitives](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép tính số học hoặc so sánh.
- {{jsxref("Temporal/Duration/with", "Temporal.Duration.prototype.with()")}}
  - : Trả về một đối tượng `Temporal.Duration` mới đại diện cho duration này với một số trường được thay thế bằng các giá trị mới.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal")}}
