---
title: Sử dụng định dạng ngày và giờ trong HTML
short-title: Định dạng ngày và giờ
slug: Web/HTML/Guides/Date_and_time_formats
page-type: guide
sidebar: htmlsidebar
---

Một số phần tử HTML sử dụng giá trị ngày và/hoặc giờ. Các định dạng của các chuỗi chỉ định các giá trị này được mô tả trong bài viết này.

Các phần tử sử dụng các định dạng như vậy bao gồm một số dạng của phần tử {{HTMLElement("input")}} cho phép người dùng chọn hoặc chỉ định ngày, giờ hoặc cả hai, cũng như các phần tử {{HTMLElement("ins")}} và {{HTMLElement("del")}}, có thuộc tính [`datetime`](/en-US/docs/Web/HTML/Reference/Elements/ins#datetime) chỉ định ngày hoặc ngày và giờ mà việc chèn hoặc xóa nội dung đã xảy ra.

Đối với `<input>`, các giá trị [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) của các input có [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) chứa chuỗi đại diện cho ngày và/hoặc giờ là:

- [`date`](/en-US/docs/Web/HTML/Reference/Elements/input/date)
- [`datetime-local`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local)
- [`month`](/en-US/docs/Web/HTML/Reference/Elements/input/month)
- [`time`](/en-US/docs/Web/HTML/Reference/Elements/input/time)
- [`week`](/en-US/docs/Web/HTML/Reference/Elements/input/week)

## Ví dụ

Trước khi đi sâu vào các chi tiết phức tạp của cách chuỗi ngày và giờ được viết và phân tích trong HTML, đây là một số ví dụ sẽ cho bạn ý tưởng tốt về giao diện của các định dạng chuỗi ngày và giờ được sử dụng phổ biến hơn.

<table class="standard-table">
  <caption>
    Ví dụ các chuỗi ngày và giờ HTML
  </caption>
  <thead>
    <tr>
      <th scope="col">Chuỗi</th>
      <th colspan="2" scope="col">Ngày và/hoặc giờ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>2005-06-07</code></td>
      <td>Ngày 7 tháng 6 năm 2005</td>
      <td>
        <a href="#date_strings"
          >[chi tiết]</a
        >
      </td>
    </tr>
    <tr>
      <td><code>08:45</code></td>
      <td>8:45 SA</td>
      <td>
        <a href="#time_strings"
          >[chi tiết]</a
        >
      </td>
    </tr>
    <tr>
      <td><code>08:45:25</code></td>
      <td>8:45 SA và 25 giây</td>
      <td>
        <a href="#time_strings"
          >[chi tiết]</a
        >
      </td>
    </tr>
    <tr>
      <td><code>0033-08-04T03:40</code></td>
      <td>3:40 SA ngày 4 tháng 8 năm 33</td>
      <td>
        <a
          href="#local_date_and_time_strings"
          >[chi tiết]</a
        >
      </td>
    </tr>
    <tr>
      <td><code>1977-04-01T14:00:30</code></td>
      <td>30 giây sau 2:00 CH ngày 1 tháng 4 năm 1977</td>
      <td>
        <a
          href="#local_date_and_time_strings"
          >[chi tiết]</a
        >
      </td>
    </tr>
    <tr>
      <td><code>1901-01-01T00:00Z</code></td>
      <td>Nửa đêm UTC ngày 1 tháng 1 năm 1901</td>
      <td>
        <a
          href="#global_date_and_time_strings"
          >[chi tiết]</a
        >
      </td>
    </tr>
    <tr>
      <td><code>1901-01-01T00:00:01-04:00</code></td>
      <td>
        1 giây sau nửa đêm theo Giờ Chuẩn Miền Đông (EST) ngày 1 tháng 1 năm 1901
      </td>
      <td>
        <a
          href="#global_date_and_time_strings"
          >[chi tiết]</a
        >
      </td>
    </tr>
  </tbody>
</table>

## Cơ bản

Trước khi xem xét các định dạng khác nhau của chuỗi liên quan đến ngày và giờ được sử dụng bởi các phần tử HTML, sẽ hữu ích khi hiểu một số thực tế cơ bản về cách chúng được định nghĩa. HTML sử dụng một biến thể của chuẩn [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) cho các chuỗi ngày và giờ của nó. Đáng xem qua các mô tả về các định dạng bạn đang sử dụng để đảm bảo rằng các chuỗi của bạn thực sự tương thích với HTML, vì đặc tả HTML bao gồm các thuật toán phân tích cú pháp các chuỗi này thực sự chính xác hơn ISO 8601, do đó có thể có những khác biệt tinh tế trong cách các chuỗi ngày và giờ được mong đợi trông như thế nào.

### Bộ ký tự

Ngày và giờ trong HTML luôn là các chuỗi sử dụng bộ ký tự {{Glossary("ASCII")}}.

### Số năm

Để đơn giản hóa định dạng cơ bản được sử dụng cho chuỗi ngày trong HTML, đặc tả yêu cầu tất cả các năm phải được cho bằng cách sử dụng lịch [Gregory](https://en.wikipedia.org/wiki/Gregorian_calendar) hiện đại (hoặc **proleptic**). Mặc dù giao diện người dùng có thể cho phép nhập ngày bằng các lịch khác, giá trị cơ bản luôn sử dụng lịch Gregory.

Mặc dù lịch Gregory không được tạo ra cho đến năm 1582 (thay thế lịch Julius tương tự), vì mục đích HTML, lịch Gregory được mở rộng ngược về năm 1 CN. Hãy đảm bảo rằng bất kỳ ngày cũ hơn nào đều tính đến điều này.

Vì mục đích ngày tháng HTML, các năm luôn có ít nhất bốn chữ số; các năm trước năm 1000 được đệm bằng các số không ở đầu (`0`), vì vậy năm 72 được viết là `0072`. Các năm trước năm 1 CN không được hỗ trợ, vì vậy HTML không hỗ trợ các năm 1 TCN (1 B.C.) trở về trước.

Một năm thường có 365 ngày, ngoại trừ trong **[năm nhuận](#leap_years)**.

#### Năm nhuận

Một **năm nhuận** là bất kỳ năm nào chia hết cho 400 _hoặc_ năm chia hết cho 4 nhưng không chia hết cho 100. Mặc dù năm lịch thường có 365 ngày, trên thực tế Trái Đất mất khoảng 365,2422 ngày để hoàn thành một vòng quỹ đạo quanh mặt trời. Năm nhuận giúp điều chỉnh lịch để giữ cho nó đồng bộ với vị trí thực tế của hành tinh trong quỹ đạo của nó. Thêm một ngày vào năm cứ bốn năm một lần về cơ bản làm cho năm trung bình dài 365,25 ngày, gần với con số đúng.

Các điều chỉnh đối với thuật toán (lấy năm nhuận khi năm có thể chia cho 400, và bỏ qua năm nhuận khi năm chia hết cho 100) giúp đưa mức trung bình đến gần hơn với số ngày chính xác (365,2425 ngày). Các nhà khoa học đôi khi thêm giây nhuận vào lịch (thật ra đó là sự thật) để xử lý ba phần mười nghìn ngày còn lại và để bù đắp cho sự chậm lại tự nhiên dần dần của sự quay của Trái Đất.

Trong khi tháng `02`, tháng Hai, thường có 28 ngày, nó có 29 ngày trong năm nhuận.

### Các tháng trong năm

Có 12 tháng trong năm, được đánh số từ 1 đến 12. Chúng luôn được đại diện bằng một chuỗi ASCII hai chữ số có giá trị từ `01` đến `12`. Xem bảng trong phần [Các ngày trong tháng](#days_of_the_month) để biết số tháng và tên tương ứng (và độ dài theo ngày).

### Các ngày trong tháng

Các tháng số 1, 3, 5, 7, 8, 10 và 12 có 31 ngày. Các tháng 4, 6, 9 và 11 có 30 ngày. Tháng 2, tháng Hai, có 28 ngày trong hầu hết các năm, nhưng có 29 ngày trong năm nhuận. Điều này được mô tả chi tiết trong bảng sau.

<table class="standard-table">
  <caption>
    Các tháng trong năm và độ dài của chúng theo ngày
  </caption>
  <thead>
    <tr>
      <th scope="row">Số tháng</th>
      <th scope="col">Tên (tiếng Anh)</th>
      <th scope="col">Độ dài theo ngày</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">01</th>
      <td>January</td>
      <td>31</td>
    </tr>
    <tr>
      <th scope="row">02</th>
      <td>February</td>
      <td>28 (29 trong năm nhuận)</td>
    </tr>
    <tr>
      <th scope="row">03</th>
      <td>March</td>
      <td>31</td>
    </tr>
    <tr>
      <th scope="row">04</th>
      <td>April</td>
      <td>30</td>
    </tr>
    <tr>
      <th scope="row">05</th>
      <td>May</td>
      <td>31</td>
    </tr>
    <tr>
      <th scope="row">06</th>
      <td>June</td>
      <td>30</td>
    </tr>
    <tr>
      <th scope="row">07</th>
      <td>July</td>
      <td>31</td>
    </tr>
    <tr>
      <th scope="row">08</th>
      <td>August</td>
      <td>31</td>
    </tr>
    <tr>
      <th scope="row">09</th>
      <td>September</td>
      <td>30</td>
    </tr>
    <tr>
      <th scope="row">10</th>
      <td>October</td>
      <td>31</td>
    </tr>
    <tr>
      <th scope="row">11</th>
      <td>November</td>
      <td>30</td>
    </tr>
    <tr>
      <th scope="row">12</th>
      <td>December</td>
      <td>31</td>
    </tr>
  </tbody>
</table>

## Chuỗi tuần

Một chuỗi tuần chỉ định một tuần trong một năm cụ thể. Một **chuỗi tuần hợp lệ** bao gồm một [số năm](#year_numbers) hợp lệ, theo sau là một ký tự gạch ngang (`-`, hoặc U+002D), sau đó là chữ hoa `W` (U+0057), tiếp theo là giá trị tuần trong năm hai chữ số.

Tuần trong năm là một chuỗi hai chữ số từ `01` đến `53`. Mỗi tuần bắt đầu vào thứ Hai và kết thúc vào Chủ Nhật. Điều đó có nghĩa là có thể một vài ngày đầu tháng Giêng được coi là một phần của tuần-năm trước, và một vài ngày cuối tháng Mười Hai được coi là một phần của tuần-năm tiếp theo. Tuần đầu tiên của năm là tuần chứa _thứ Năm đầu tiên của năm_. Ví dụ, thứ Năm đầu tiên của năm 1953 là ngày 1 tháng Giêng, vì vậy tuần đó — bắt đầu từ thứ Hai, ngày 29 tháng Mười Hai — được coi là tuần đầu tiên của năm. Do đó, ngày 30 tháng Mười Hai năm 1952 xảy ra trong tuần `1953-W01`.

Một năm có 53 tuần nếu:

- Ngày đầu tiên của năm dương lịch (1 tháng Giêng) là thứ Năm **hoặc**
- Ngày đầu tiên của năm (1 tháng Giêng) là thứ Tư và năm đó là [năm nhuận](#leap_years)

Tất cả các năm khác có 52 tuần.

| Chuỗi tuần | Tuần và năm (Phạm vi ngày)                                |
| ---------- | --------------------------------------------------------- |
| `2001-W37` | Tuần 37, 2001 (10-16 tháng 9 năm 2001)                    |
| `1953-W01` | Tuần 1, 1953 (29 tháng 12 năm 1952 - 4 tháng 1 năm 1953)  |
| `1948-W53` | Tuần 53, 1948 (27 tháng 12 năm 1948 - 2 tháng 1 năm 1949) |
| `1949-W01` | Tuần 1, 1949 (3-9 tháng 1 năm 1949)                       |
| `0531-W16` | Tuần 16, 531 (13-19 tháng 4 năm 531)                      |
| `0042-W04` | Tuần 4, 42 (21-27 tháng 1 năm 42)                         |

Lưu ý rằng cả số năm và số tuần đều được đệm bằng các số không ở đầu, với năm được đệm thành bốn chữ số và tuần thành hai chữ số.

## Chuỗi tháng

Một chuỗi tháng đại diện cho một tháng cụ thể trong thời gian, thay vì một tháng chung của năm. Tức là, thay vì đại diện cho "tháng Giêng," một chuỗi tháng HTML đại diện cho một tháng và năm được ghép với nhau, như "tháng Giêng năm 1972."

Một **chuỗi tháng hợp lệ** bao gồm một [số năm](#year_numbers) hợp lệ (một chuỗi ít nhất bốn chữ số), theo sau là một ký tự gạch ngang (`-`, hoặc U+002D), tiếp theo là [số tháng](#months_of_the_year) số học hai chữ số, trong đó `01` đại diện cho tháng Giêng và `12` đại diện cho tháng Mười Hai.

| Chuỗi tháng | Tháng và năm       |
| ----------- | ------------------ |
| `17310-09`  | Tháng 9, năm 17310 |
| `2019-01`   | Tháng Giêng, 2019  |
| `1993-11`   | Tháng 11, 1993     |
| `0571-04`   | Tháng 4, năm 571   |
| `0001-07`   | Tháng 7, năm 1 CN  |

Lưu ý rằng tất cả các năm đều có ít nhất bốn ký tự; các năm có ít hơn bốn chữ số được đệm bằng các số không ở đầu.

## Chuỗi ngày

Một chuỗi ngày hợp lệ bao gồm một [chuỗi tháng](#month_strings), theo sau là một ký tự gạch ngang (`-`, hoặc U+002D), tiếp theo là [ngày trong tháng](#days_of_the_month) hai chữ số.

| Chuỗi ngày   | Ngày đầy đủ          |
| ------------ | -------------------- |
| `1993-11-01` | 1 tháng 11 năm 1993  |
| `1066-10-14` | 14 tháng 10 năm 1066 |
| `0571-04-22` | 22 tháng 4 năm 571   |
| `0062-02-05` | 5 tháng 2 năm 62     |

## Chuỗi giờ

Một chuỗi giờ có thể chỉ định một giờ với độ chính xác đến phút, giây, hoặc đến mili giây. Chỉ chỉ định giờ hoặc phút không được phép. Một **chuỗi giờ hợp lệ** tối thiểu bao gồm giờ hai chữ số theo sau là dấu hai chấm (`:`, U+003A), sau đó là phút hai chữ số. Phút có thể tùy chọn theo sau bởi một dấu hai chấm khác và số giây hai chữ số. Mili giây có thể được chỉ định, tùy chọn, bằng cách thêm ký tự dấu chấm thập phân (`.`, U+002E) theo sau bởi một, hai hoặc ba chữ số.

Có một số quy tắc cơ bản bổ sung:

- Giờ luôn được chỉ định bằng đồng hồ 24 giờ, với `00` là nửa đêm và 11 giờ tối là `23`. Không có giá trị nào ngoài phạm vi `00` – `23` được phép.
- Phút phải là số hai chữ số từ `00` đến `59`. Không có giá trị nào ngoài phạm vi đó được phép.
- Nếu số giây bị bỏ qua (để chỉ định giờ chính xác đến phút), không nên có dấu hai chấm nào theo sau số phút.
- Nếu được chỉ định, phần nguyên của số giây phải từ `00` đến `59`. Bạn _không thể_ chỉ định giây nhuận bằng cách sử dụng các giá trị như `60` hoặc `61`.
- Nếu số giây được chỉ định và là số nguyên, nó không được theo sau bởi dấu chấm thập phân.
- Nếu một phần nhỏ của giây được bao gồm, nó có thể dài từ một đến ba chữ số, biểu thị số mili giây. Nó theo sau dấu chấm thập phân được đặt sau thành phần giây của chuỗi giờ.

| Chuỗi giờ     | Giờ                                     |
| ------------- | --------------------------------------- |
| `00:00:30.75` | 12:00:30.75 SA (30,75 giây sau nửa đêm) |
| `12:15`       | 12:15 CH                                |
| `13:44:25`    | 1:44:25 CH (25 giây sau 1:44 CH)        |

## Chuỗi ngày và giờ địa phương

Một chuỗi [`datetime-local`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local) hợp lệ bao gồm một chuỗi `date` và một chuỗi `time` được ghép với nhau bằng chữ cái `T` hoặc ký tự khoảng trắng phân cách chúng. Không có thông tin về múi giờ nào được bao gồm trong chuỗi; ngày và giờ được giả định là ở múi giờ địa phương của người dùng.

Khi bạn đặt [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của input `datetime-local`, chuỗi được **chuẩn hóa** thành dạng chuẩn. Các chuỗi `datetime` đã chuẩn hóa luôn sử dụng chữ cái `T` để phân cách ngày và giờ, và phần giờ của chuỗi được rút ngắn tối đa có thể. Điều này được thực hiện bằng cách bỏ qua thành phần giây nếu giá trị của nó là `:00`.

<table class="standard-table">
  <caption>
    Ví dụ về các chuỗi
    <code>datetime-local</code>
    hợp lệ
  </caption>
  <thead>
    <tr>
      <th scope="col">Chuỗi ngày/giờ</th>
      <th scope="col">Chuỗi ngày/giờ đã chuẩn hóa</th>
      <th scope="col">Ngày và giờ thực tế</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>1986-01-28T11:38:00.01</code></td>
      <td><code>1986-01-28T11:38:00.01</code></td>
      <td>28 tháng 1 năm 1986 lúc 11:38:00.01 SA</td>
    </tr>
    <tr>
      <td><code>1986-01-28 11:38:00.010</code></td>
      <td>
        <p><code>1986-01-28T11:38:00.01</code></p>
        <p>
          Lưu ý rằng sau khi chuẩn hóa, đây là cùng chuỗi như chuỗi
          <code>datetime-local</code> trước. Khoảng trắng đã được thay thế bằng
          ký tự <code>T</code> và số không ở cuối trong phần nhỏ của giây đã
          được loại bỏ để chuỗi ngắn nhất có thể.
        </p>
      </td>
      <td>28 tháng 1 năm 1986 lúc 11:38:00.01 SA</td>
    </tr>
    <tr>
      <td><code>0170-07-31T22:00:00</code></td>
      <td>
        <p><code>0170-07-31T22:00</code></p>
        <p>
          Lưu ý rằng dạng chuẩn hóa của ngày này bỏ
          <code>:00</code> biểu thị số giây bằng không,
          vì giây là tùy chọn khi bằng không, và chuỗi đã chuẩn hóa
          rút ngắn độ dài của chuỗi tối đa.
        </p>
      </td>
      <td>31 tháng 7 năm 170 lúc 10:00 CH</td>
    </tr>
  </tbody>
</table>

## Chuỗi ngày và giờ toàn cầu

Một chuỗi ngày và giờ toàn cầu chỉ định một ngày và giờ cũng như múi giờ mà nó xảy ra. Một **chuỗi ngày và giờ toàn cầu hợp lệ** có cùng định dạng như một [chuỗi ngày và giờ địa phương](#local_date_and_time_strings), ngoại trừ nó có một chuỗi múi giờ được thêm vào cuối, sau giờ.

### Chuỗi độ lệch múi giờ

Một chuỗi độ lệch múi giờ chỉ định độ lệch theo số dương hoặc âm của giờ và phút so với cơ sở thời gian chuẩn. Có hai cơ sở thời gian chuẩn, rất gần nhau nhưng không hoàn toàn giống nhau:

- Đối với các ngày sau khi thành lập [Giờ Phối hợp Quốc tế](https://en.wikipedia.org/wiki/Coordinated_Universal_Time) (UTC) vào đầu những năm 1960, cơ sở thời gian là `Z` và độ lệch biểu thị độ lệch của một múi giờ cụ thể so với giờ tại kinh tuyến gốc ở kinh độ 0º (đi qua Đài Quan sát Hoàng gia tại Greenwich, Anh).
- Đối với các ngày trước UTC, cơ sở thời gian thay vào đó được biểu thị theo [UT1](https://en.wikipedia.org/wiki/UT1), là giờ mặt trời Trái Đất đương đại tại kinh tuyến gốc.

Chuỗi múi giờ được thêm vào ngay sau giờ trong chuỗi ngày và giờ. Bạn có thể chỉ định `Z` làm chuỗi độ lệch múi giờ để biểu thị rằng giờ được chỉ định theo UTC. Nếu không, chuỗi múi giờ được xây dựng như sau:

1. Một ký tự biểu thị dấu của độ lệch: ký tự cộng (`+`, hoặc U+002B) cho các múi giờ phía đông kinh tuyến gốc hoặc ký tự trừ (`-`, hoặc U+002D) cho các múi giờ phía tây kinh tuyến gốc.
2. Số giờ hai chữ số mà múi giờ lệch so với kinh tuyến gốc. Giá trị này phải từ `00` đến `23`.
3. Một ký tự dấu hai chấm (`:`) tùy chọn.
4. Số phút hai chữ số sau giờ; giá trị này phải từ `00` đến `59`.

Mặc dù định dạng này cho phép các múi giờ từ -23:59 đến +23:59, phạm vi hiện tại của các độ lệch múi giờ là -12:00 đến +14:00, và không có múi giờ nào hiện tại lệch khỏi giờ theo bất kỳ điều gì khác ngoài `00`, `30` hoặc `45` phút. Điều này có thể thay đổi ít nhiều bất cứ lúc nào, vì các quốc gia có thể tự do thay đổi múi giờ của họ bất cứ lúc nào và theo bất kỳ cách nào họ muốn.

<table class="no-markdown">
  <caption>
    Ví dụ về các chuỗi ngày và giờ toàn cầu hợp lệ
  </caption>
  <thead>
    <tr>
      <th scope="col">Chuỗi ngày và giờ toàn cầu</th>
      <th scope="col">Ngày và giờ toàn cầu thực tế</th>
      <th scope="col">Ngày và giờ tại kinh tuyến gốc</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>2005-06-07T00:00Z</code></td>
      <td>7 tháng 6 năm 2005 lúc nửa đêm UTC</td>
      <td>7 tháng 6 năm 2005 lúc nửa đêm</td>
    </tr>
    <tr>
      <td><code>1789-08-22T12:30:00.1-04:00</code></td>
      <td>
        22 tháng 8 năm 1789 lúc một phần mười giây sau 12:30 CH theo Giờ Ban Ngày
        Miền Đông (EDT)
      </td>
      <td>22 tháng 8 năm 1789 lúc một phần mười giây sau 4:30 CH</td>
    </tr>
    <tr>
      <td><code>3755-01-01 00:00+10:00</code></td>
      <td>
        1 tháng 1 năm 3755 lúc nửa đêm theo Giờ Chuẩn Miền Đông Úc (AEST)
      </td>
      <td>31 tháng 12 năm 3754 lúc 2:00 CH</td>
    </tr>
  </tbody>
</table>

## Các vấn đề về ngày tháng

Do các vấn đề về lưu trữ và độ chính xác dữ liệu, bạn có thể muốn biết về một số vấn đề phía client và phía server.

### Vấn đề Y2K38 (thường phía server)

JavaScript sử dụng số dấu phẩy động độ chính xác kép để lưu trữ ngày tháng, như với tất cả các số, có nghĩa là code JavaScript sẽ không gặp phải vấn đề Y2K38 trừ khi ép kiểu số nguyên/bit-hacks được sử dụng vì tất cả các toán tử bit JavaScript sử dụng số nguyên bổ sung 2 có dấu 32 bit.

Vấn đề là với phía server của mọi thứ: lưu trữ các ngày lớn hơn 2^31 - 1. Để khắc phục vấn đề này, bạn phải lưu trữ tất cả các ngày bằng cách sử dụng số nguyên không dấu 32 bit, số nguyên có dấu 64 bit, hoặc số dấu phẩy động độ chính xác kép trên máy chủ. Nếu máy chủ của bạn được viết bằng PHP, việc khắc phục có thể yêu cầu nâng cấp PHP lên phiên bản mới hơn, và nâng cấp phần cứng lên x86_64 hoặc IA64. Nếu bạn bị kẹt với phần cứng khác, bạn có thể thử mô phỏng phần cứng 64 bit bên trong máy ảo 32 bit, nhưng hầu hết các VM không hỗ trợ loại ảo hóa này, vì sự ổn định có thể bị ảnh hưởng, và hiệu suất chắc chắn sẽ bị ảnh hưởng đáng kể.

### Vấn đề Y10k (thường phía client)

Trên nhiều máy chủ, ngày tháng được lưu trữ dưới dạng số thay vì chuỗi — các số có kích thước cố định và không phụ thuộc vào định dạng (ngoại trừ thứ tự byte). Sau năm 10.000, những con số đó sẽ chỉ lớn hơn một chút so với trước đây, vì vậy nhiều máy chủ sẽ không gặp vấn đề với các biểu mẫu được gửi sau năm 10.000.

Vấn đề là với phía client: phân tích cú pháp các ngày có hơn 4 chữ số trong năm.

```html
<!--midnight of January 1st, 10000: the exact time of Y10K-->
<input type="datetime-local" value="+010000-01-01T05:00" />
```

Chúng ta cần chuẩn bị code của mình cho bất kỳ số chữ số nào — không chỉ 5. Hàm JavaScript sau đây lập trình đặt giá trị:

```js
function setValue(element, date) {
  const isoString = date.toISOString();
  element.value = isoString.substring(0, isoString.indexOf("T") + 6);
}
```

Tại sao lo lắng về vấn đề Y10K nếu nó sẽ xảy ra nhiều thế kỷ sau khi bạn chết? Chính xác là vì bạn sẽ đã chết rồi, vì vậy các công ty sử dụng phần mềm của bạn sẽ bị kẹt khi sử dụng phần mềm của bạn mà không có bất kỳ lập trình viên nào khác hiểu hệ thống đủ để vào và sửa nó.

## Xem thêm

- {{HTMLElement("input")}}
- {{HTMLElement("ins")}} và {{HTMLElement("del")}}: xem thuộc tính `datetime`, chỉ định ngày hoặc ngày và giờ địa phương mà nội dung được chèn hoặc xóa
- [Đặc tả ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html)
- [Biểu diễn ngày & giờ](/en-US/docs/Web/JavaScript/Guide/Representing_dates_times) trong [Hướng dẫn JavaScript](/en-US/docs/Web/JavaScript/Guide)
- Đối tượng JavaScript {{jsxref("Date")}}
- Đối tượng [`Intl.DateTimeFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat) để định dạng ngày và giờ cho một ngôn ngữ nhất định
