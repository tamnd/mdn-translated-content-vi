---
title: Representing dates & times
slug: Web/JavaScript/Guide/Representing_dates_times
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Numbers_and_strings", "Web/JavaScript/Guide/Regular_expressions")}}

> [!NOTE]
> Đối tượng `Date` hiện được coi là legacy và nên tránh sử dụng trong code mới. Chúng tôi sẽ cập nhật trang này với các giải pháp thay thế hiện đại sớm.

## Đối tượng Date

JavaScript không có kiểu dữ liệu ngày tháng. Tuy nhiên, bạn có thể sử dụng đối tượng {{jsxref("Date")}} và các phương thức của nó để làm việc với ngày tháng và thời gian trong ứng dụng. Đối tượng `Date` có nhiều phương thức để thiết lập, lấy và thao tác ngày tháng. Nó không có bất kỳ thuộc tính nào.

JavaScript xử lý ngày tháng tương tự như Java. Hai ngôn ngữ có nhiều phương thức ngày tháng giống nhau, và cả hai ngôn ngữ đều lưu ngày tháng dưới dạng số mili giây kể từ nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC, trong đó Unix Timestamp là số giây kể từ cùng thời điểm đó. Thời điểm nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC được gọi là [epoch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

Phạm vi của đối tượng `Date` là -100.000.000 ngày đến 100.000.000 ngày tính từ epoch.

Để tạo đối tượng `Date`:

```js
const dateObjectName = new Date([parameters]);
```

trong đó `dateObjectName` là tên của đối tượng `Date` đang được tạo; nó có thể là một đối tượng mới hoặc là thuộc tính của một đối tượng hiện có.

Gọi `Date` mà không có từ khóa `new` trả về một chuỗi đại diện cho ngày và giờ hiện tại.

Các `parameters` trong cú pháp trên có thể là bất kỳ thứ nào sau đây:

- Không có gì: tạo ngày và giờ hôm nay. Ví dụ, `today = new Date();`.
- Một chuỗi đại diện cho ngày, theo nhiều dạng khác nhau. Các dạng được hỗ trợ chính xác khác nhau giữa các engine, nhưng dạng sau luôn được hỗ trợ: `YYYY-MM-DDTHH:mm:ss.sssZ`. Ví dụ, `xmas95 = new Date("1995-12-25")`. Nếu bạn bỏ qua giờ, phút hoặc giây, giá trị sẽ được thiết lập thành không.
- Một tập hợp các giá trị số nguyên cho năm, tháng, và ngày. Ví dụ, `xmas95 = new Date(1995, 11, 25)`.
- Một tập hợp các giá trị số nguyên cho năm, tháng, ngày, giờ, phút và giây. Ví dụ, `xmas95 = new Date(1995, 11, 25, 9, 30, 0);`.

### Các phương thức của đối tượng Date

Các phương thức của đối tượng `Date` để xử lý ngày tháng và thời gian thuộc các danh mục rộng sau:

- Các phương thức "set", để thiết lập giá trị ngày và giờ trong các đối tượng `Date`.
- Các phương thức "get", để lấy giá trị ngày và giờ từ các đối tượng `Date`.
- Các phương thức "to", để trả về giá trị chuỗi từ các đối tượng `Date`.
- Các phương thức parse và UTC, để phân tích chuỗi `Date`.

Với các phương thức "get" và "set" bạn có thể lấy và thiết lập giây, phút, giờ, ngày trong tháng, ngày trong tuần, tháng, và năm riêng lẻ. Có phương thức `getDay` trả về ngày trong tuần, nhưng không có phương thức `setDay` tương ứng, vì ngày trong tuần được thiết lập tự động. Các phương thức này sử dụng số nguyên để biểu diễn các giá trị này như sau:

- Giây và phút: 0 đến 59
- Giờ: 0 đến 23
- Ngày: 0 (Chủ nhật) đến 6 (Thứ bảy)
- Ngày trong tháng: 1 đến 31
- Tháng: 0 (Tháng Một) đến 11 (Tháng Mười Hai)
- Năm: số năm kể từ năm 1900

Ví dụ, giả sử bạn định nghĩa ngày sau:

```js
const xmas95 = new Date("1995-12-25");
```

Thì `xmas95.getMonth()` trả về 11, và `xmas95.getFullYear()` trả về 1995.

Các phương thức `getTime` và `setTime` hữu ích khi so sánh ngày tháng. Phương thức `getTime` trả về số mili giây kể từ epoch cho đối tượng `Date`.

Ví dụ, đoạn code sau hiển thị số ngày còn lại trong năm hiện tại:

```js
const today = new Date();
const endYear = new Date(1995, 11, 31, 23, 59, 59, 999); // Set day and month
endYear.setFullYear(today.getFullYear()); // Set year to this year
const msPerDay = 24 * 60 * 60 * 1000; // Number of milliseconds per day
let daysLeft = (endYear.getTime() - today.getTime()) / msPerDay;
daysLeft = Math.round(daysLeft); // Returns days left in the year
```

Ví dụ này tạo đối tượng `Date` tên `today` chứa ngày hôm nay. Sau đó tạo đối tượng `Date` tên `endYear` và thiết lập năm thành năm hiện tại. Rồi, sử dụng số mili giây mỗi ngày, nó tính số ngày giữa `today` và `endYear`, sử dụng `getTime` và làm tròn thành số nguyên ngày.

Phương thức `parse` hữu ích để gán giá trị từ chuỗi ngày tháng cho các đối tượng `Date` hiện có. Ví dụ, đoạn code sau sử dụng `parse` và `setTime` để gán giá trị ngày cho đối tượng `ipoDate`:

```js
const ipoDate = new Date();
ipoDate.setTime(Date.parse("Aug 9, 1995"));
```

### Ví dụ

Trong ví dụ sau, hàm `JSClock()` trả về thời gian theo định dạng đồng hồ kỹ thuật số.

```js
function JSClock() {
  const time = new Date();
  const hour = time.getHours();
  const minute = time.getMinutes();
  const second = time.getSeconds();
  let temp = String(hour % 12);
  if (temp === "0") {
    temp = "12";
  }
  temp += (minute < 10 ? ":0" : ":") + minute;
  temp += (second < 10 ? ":0" : ":") + second;
  temp += hour >= 12 ? " P.M." : " A.M.";
  return temp;
}
```

Hàm `JSClock` trước tiên tạo một đối tượng `Date` mới tên `time`; vì không có đối số nào được truyền vào, time được tạo với ngày và giờ hiện tại. Sau đó các lời gọi đến các phương thức `getHours`, `getMinutes`, và `getSeconds` gán giá trị của giờ, phút và giây hiện tại cho `hour`, `minute`, và `second`.

Các câu lệnh sau xây dựng giá trị chuỗi dựa trên thời gian. Câu lệnh đầu tiên tạo biến `temp`. Giá trị của nó là `hour % 12`, là `hour` trong hệ 12 giờ. Sau đó, nếu giờ là `0`, nó được gán lại thành `12`, để nửa đêm và giữa trưa được hiển thị là `12:00` thay vì `0:00`.

Câu lệnh tiếp theo nối giá trị `minute` vào `temp`. Nếu giá trị của `minute` nhỏ hơn 10, biểu thức điều kiện thêm một chuỗi với số không ở đầu; ngược lại nó thêm một chuỗi với dấu hai chấm phân tách. Sau đó một câu lệnh nối giá trị giây vào `temp` theo cách tương tự.

Cuối cùng, một biểu thức điều kiện nối "P.M." vào `temp` nếu `hour` bằng 12 hoặc lớn hơn; ngược lại, nó nối "A.M." vào `temp`.

{{PreviousNext("Web/JavaScript/Guide/Numbers_and_strings", "Web/JavaScript/Guide/Regular_expressions")}}
