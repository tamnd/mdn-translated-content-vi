---
title: Proxy Auto-Configuration (PAC) file
slug: Web/HTTP/Guides/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file
page-type: guide
sidebar: http
---

Tệp **Proxy Auto-Configuration (PAC)** là hàm JavaScript xác định liệu các yêu cầu của trình duyệt web (HTTP, HTTPS và FTP) có đi thẳng đến đích hay được chuyển tiếp đến proxy web server. Hàm JavaScript được chứa trong tệp PAC xác định hàm:

## Cú pháp

```js
function FindProxyForURL(url, host) {
  // …
}
```

### Tham số

- `url`
  - : URL đang được truy cập. Các thành phần path và query của URL `https://` bị loại bỏ. Trong Chrome (phiên bản 52 đến 73), bạn có thể tắt điều này bằng cách đặt `PacHttpsUrlStrippingEnabled` thành `false` trong chính sách hoặc bằng cách khởi chạy với cờ dòng lệnh `--unsafe-pac-url` (trong Chrome 74, chỉ cờ hoạt động, và từ 75 trở đi không có cách nào để tắt loại bỏ path; kể từ Chrome 81, việc loại bỏ path không áp dụng cho URL HTTP, nhưng có quan tâm đến việc thay đổi hành vi này để phù hợp với HTTPS); trong Firefox, tùy chọn là `network.proxy.autoconfig_url.include_path`.
- `host`
  - : Tên máy chủ được trích xuất từ URL. Điều này chỉ để tiện lợi; nó là cùng chuỗi như giữa `://` và `:` hoặc `/` đầu tiên sau đó. Số cổng không được bao gồm trong tham số này. Nó có thể được trích xuất từ URL khi cần thiết.

## Mô tả

Trả về một chuỗi mô tả cấu hình. Định dạng của chuỗi này được định nghĩa trong **định dạng giá trị trả về** bên dưới.

### Định dạng giá trị trả về

- Hàm JavaScript trả về một chuỗi đơn
- Nếu chuỗi là null, không nên sử dụng proxy nào
- Chuỗi có thể chứa bất kỳ số lượng các khối xây dựng sau đây, được phân tách bằng dấu chấm phẩy:

<!---->

- `DIRECT`
  - : Các kết nối nên được thực hiện trực tiếp, không có proxy nào
- `PROXY host:port`
  - : Proxy được chỉ định nên được sử dụng
- `SOCKS host:port`
  - : Máy chủ SOCKS được chỉ định nên được sử dụng

Các phiên bản Firefox gần đây cũng hỗ trợ:

- `HTTP host:port`
  - : Proxy được chỉ định nên được sử dụng
- `HTTPS host:port`
  - : Proxy HTTPS được chỉ định nên được sử dụng
- `SOCKS4 host:port`, `SOCKS5 host:port`
  - : Máy chủ SOCKS được chỉ định (với phiên bản SOCK được chỉ định) nên được sử dụng

Nếu có nhiều cài đặt được phân tách bằng dấu chấm phẩy, cài đặt ngoài cùng bên trái sẽ được sử dụng, cho đến khi Firefox không thể thiết lập kết nối với proxy. Trong trường hợp đó, giá trị tiếp theo sẽ được sử dụng, v.v.

Trình duyệt sẽ tự động thử lại proxy không phản hồi trước đó sau 30 phút. Các lần thử bổ sung sẽ tiếp tục bắt đầu lúc một giờ, luôn thêm 30 phút vào thời gian trôi qua giữa các lần thử.

Nếu tất cả proxy đều ngừng hoạt động và không có tùy chọn DIRECT nào được chỉ định, trình duyệt sẽ hỏi xem proxy có nên tạm thời bị bỏ qua hay không và các kết nối trực tiếp có nên được thử hay không. Sau 20 phút, trình duyệt sẽ hỏi xem proxy có nên thử lại hay không, hỏi lại sau 40 phút nữa. Các truy vấn sẽ tiếp tục, luôn thêm 20 phút vào thời gian trôi qua giữa các truy vấn.

#### Ví dụ

- `PROXY w3proxy.netscape.com:8080; PROXY mozilla.netscape.com:8081`
  - : Proxy chính là w3proxy:8080; nếu proxy đó ngừng hoạt động, hãy bắt đầu sử dụng mozilla:8081 cho đến khi proxy chính hoạt động trở lại.
- `PROXY w3proxy.netscape.com:8080; PROXY mozilla.netscape.com:8081; DIRECT`
  - : Tương tự như trên, nhưng nếu cả hai proxy đều ngừng hoạt động, hãy tự động bắt đầu thực hiện các kết nối trực tiếp. (Trong ví dụ đầu tiên ở trên, Netscape sẽ hỏi người dùng xác nhận về việc thực hiện kết nối trực tiếp; trong trường hợp này, không có sự can thiệp của người dùng.)
- `PROXY w3proxy.netscape.com:8080; SOCKS socks:1080`
  - : Sử dụng SOCKS nếu proxy chính ngừng hoạt động.

Tệp auto-config nên được lưu vào tệp với phần mở rộng tên tệp .pac: `proxy.pac`.

Và loại MIME nên được đặt thành `application/x-ns-proxy-autoconfig`.

Tiếp theo, bạn nên cấu hình máy chủ của mình để ánh xạ phần mở rộng tên tệp .pac với loại MIME.

> [!NOTE]
>
> - Hàm JavaScript nên luôn được lưu vào tệp riêng của nó nhưng không được nhúng vào tệp HTML hay tệp nào khác.
> - Các ví dụ ở cuối tài liệu này là hoàn chỉnh. Không cần cú pháp bổ sung để lưu vào tệp và sử dụng nó. (Tất nhiên, các JavaScript phải được chỉnh sửa để phản ánh tên domain và/hoặc mạng con của trang web bạn.)

## Các hàm và môi trường được xác định trước

Các hàm này có thể được sử dụng trong việc xây dựng tệp PAC:

- Điều kiện dựa trên tên máy chủ
  - [`isPlainHostName()`](#isplainhostname)
  - [`dnsDomainIs()`](#dnsdomainis)
  - [`localHostOrDomainIs()`](#localhostordomainis)
  - [`isResolvable()`](#isresolvable)
  - [`isInNet()`](#isinnet)

- Các hàm tiện ích liên quan
  - [`dnsResolve()`](#dnsresolve)
  - [`convert_addr()`](#convert_addr)
  - [`myIpAddress()`](#myipaddress)
  - [`dnsDomainLevels()`](#dnsdomainlevels)

- Điều kiện dựa trên URL/tên máy chủ
  - [`shExpMatch()`](#shexpmatch)

- Điều kiện dựa trên thời gian
  - [`weekdayRange()`](#weekdayrange)
  - [`dateRange()`](#daterange)
  - [`timeRange()`](#timerange)

- Tiện ích ghi nhật ký
  - [`alert()`](#alert)

- Có một mảng liên kết (đối tượng) đã được định nghĩa sẵn, vì tại thời điểm đó code JavaScript không thể tự định nghĩa nó:
  - `ProxyConfig.bindings` {{deprecated_inline}}

> [!NOTE]
> pactester (một phần của gói [pacparser](https://github.com/manugarg/pacparser)) đã được sử dụng để kiểm tra các ví dụ cú pháp sau đây.
>
> - Tệp PAC được đặt tên là `proxy.pac`
> - Dòng lệnh: `pactester -p ~/pacparser-master/tests/proxy.pac -u https://www.mozilla.org` (truyền tham số `host` `www.mozilla.org` và tham số `url` `https://www.mozilla.org`)

### isPlainHostName()

#### Cú pháp

```js-nolint
isPlainHostName(host)
```

#### Tham số

- host
  - : Tên máy chủ từ URL (không bao gồm số cổng).

#### Mô tả

True nếu và chỉ khi không có tên domain trong tên máy chủ (không có dấu chấm).

#### Ví dụ

```js
isPlainHostName("www.mozilla.org"); // false
isPlainHostName("www"); // true
```

### `dnsDomainIs()`

#### Cú pháp

```js-nolint
dnsDomainIs(host, domain)
```

#### Tham số

- host
  - : Là tên máy chủ từ URL.
- domain
  - : Là tên domain để kiểm tra tên máy chủ.

#### Mô tả

Trả về true nếu và chỉ khi domain của tên máy chủ khớp.

#### Ví dụ

```js-nolint
dnsDomainIs("www.mozilla.org", ".mozilla.org") // true
dnsDomainIs("www", ".mozilla.org") // false
```

### localHostOrDomainIs()

#### Cú pháp

```js-nolint
localHostOrDomainIs(host, hostDom)
```

#### Tham số

- host
  - : Tên máy chủ từ URL.
- hostDom
  - : Tên máy chủ đủ điều kiện để khớp.

#### Mô tả

Là true nếu tên máy chủ khớp _chính xác_ với tên máy chủ được chỉ định, hoặc nếu không có phần tên domain trong tên máy chủ, nhưng tên máy chủ không đủ điều kiện khớp.

#### Ví dụ

```js-nolint
localHostOrDomainIs("www.mozilla.org", "www.mozilla.org") // true (exact match)
localHostOrDomainIs("www", "www.mozilla.org") // true (hostname match, domain not specified)
localHostOrDomainIs("www.google.com", "www.mozilla.org") // false (domain name mismatch)
localHostOrDomainIs("home.mozilla.org", "www.mozilla.org") // false (hostname mismatch)
```

### isResolvable()

#### Cú pháp

```js-nolint
isResolvable(host)
```

#### Tham số

- host
  - : là tên máy chủ từ URL.

Cố gắng phân giải tên máy chủ. Trả về true nếu thành công.

#### Ví dụ

```js-nolint
isResolvable("www.mozilla.org") // true
```

### isInNet()

#### Cú pháp

```js-nolint
isInNet(host, pattern, mask)
```

#### Tham số

- host
  - : Tên máy chủ DNS hoặc địa chỉ IP. Nếu tên máy chủ được truyền, nó sẽ được hàm này phân giải thành địa chỉ IP.
- pattern
  - : Mẫu địa chỉ IP theo định dạng phân tách bằng dấu chấm.
- mask
  - : Mặt nạ cho mẫu địa chỉ IP cho biết phần nào của địa chỉ IP cần khớp. 0 có nghĩa là bỏ qua, 255 có nghĩa là khớp.

True nếu và chỉ khi địa chỉ IP của máy chủ khớp với mẫu địa chỉ IP được chỉ định.

Thông số kỹ thuật mẫu và mặt nạ được thực hiện theo cách tương tự như đối với cấu hình SOCKS.

#### Ví dụ

```js
function FindProxyForURL(url, host) {
  alert(isInNet(host, "192.0.2.172", "255.255.255.255"));
  // "PAC-alert: true"
}
```

### dnsResolve()

```js-nolint
dnsResolve(host)
```

#### Tham số

- host
  - : Tên máy chủ cần phân giải.

Phân giải tên máy chủ DNS đã cho thành địa chỉ IP và trả về nó theo định dạng phân tách bằng dấu chấm như một chuỗi.

#### Ví dụ

```js
dnsResolve("www.mozilla.org"); // returns the string "104.16.41.2"
```

### convert_addr()

#### Cú pháp

```js-nolint
convert_addr(ipaddr)
```

#### Tham số

- ipaddr
  - : Bất kỳ địa chỉ có dấu chấm nào như địa chỉ IP hoặc mặt nạ.

Nối bốn byte được phân tách bằng dấu chấm thành một từ 4 byte và chuyển đổi nó sang thập phân.

#### Ví dụ

```js
convert_addr("192.0.2.172"); // returns the decimal number 1745889538
```

### myIpAddress()

#### Cú pháp

```js-nolint
myIpAddress()
```

#### Tham số

(không có)

#### Giá trị trả về

Trả về địa chỉ IP máy chủ của máy Firefox đang chạy, như một chuỗi theo định dạng số nguyên phân tách bằng dấu chấm. Để hữu ích hơn, nó sẽ thử một số phương án thay thế trước khi quay lại địa chỉ loopback (như `127.0.0.1`).

#### Ví dụ

```js-nolint
myIpAddress()
```

### dnsDomainLevels()

#### Cú pháp

```js-nolint
dnsDomainLevels(host)
```

#### Tham số

- host
  - : là tên máy chủ từ URL.

Trả về số (số nguyên) cấp độ domain DNS (số dấu chấm) trong tên máy chủ.

#### Ví dụ

```js-nolint
dnsDomainLevels("www") // 0
dnsDomainLevels("mozilla.org") // 1
dnsDomainLevels("www.mozilla.org"); // 2
```

### shExpMatch()

#### Cú pháp

```js-nolint
shExpMatch(str, shExp)
```

#### Tham số

- str
  - : là bất kỳ chuỗi nào để so sánh (ví dụ: URL hoặc tên máy chủ).
- shExp
  - : là biểu thức shell để so sánh.

Trả về `true` nếu chuỗi khớp với biểu thức glob shell được chỉ định.

Hỗ trợ cho cú pháp biểu thức glob cụ thể khác nhau giữa các trình duyệt: `*` (khớp với bất kỳ số lượng ký tự nào) và `?` (khớp một ký tự) luôn được hỗ trợ, trong khi `[characters]` và `[^characters]` được một số triển khai hỗ trợ thêm (bao gồm Firefox).

> [!NOTE]
> Nếu được client hỗ trợ, biểu thức chính quy JavaScript thường cung cấp cách khớp mẫu URL (và các chuỗi khác) mạnh mẽ và nhất quán hơn.

#### Ví dụ

```js
shExpMatch("http://home.netscape.com/people/ari/index.html", "*/ari/*"); // returns true
shExpMatch("http://home.netscape.com/people/montulli/index.html", "*/ari/*"); // returns false
```

### weekdayRange()

#### Cú pháp

```js-nolint
weekdayRange(wd1, wd2)
weekdayRange(wd1, wd2, gmt)
```

> [!NOTE]
> (Trước Firefox 49) wd1 phải nhỏ hơn wd2 nếu bạn muốn hàm đánh giá các tham số này như một phạm vi. Xem cảnh báo bên dưới.

#### Tham số

- wd1 và wd2
  - : Một trong các chuỗi ngày làm việc được sắp xếp: `"SUN"`, `"MON"`, `"TUE"`, `"WED"`, `"THU"`, `"FRI"`, `"SAT"`
- gmt
  - : Là chuỗi "GMT" hoặc được bỏ qua.

Chỉ tham số đầu tiên là bắt buộc. Tham số thứ hai, thứ ba hoặc cả hai có thể được bỏ qua.

Nếu chỉ có một tham số hiện diện, hàm trả về giá trị true vào ngày trong tuần mà tham số đại diện. Nếu chuỗi "GMT" được chỉ định là tham số thứ hai, thời gian được lấy theo giờ GMT. Nếu không, chúng được coi là theo múi giờ cục bộ.

Nếu cả **wd1** và **wd2** đều được xác định, điều kiện là true nếu ngày trong tuần hiện tại nằm giữa hai ngày trong tuần _được sắp xếp_ đó. Các giới hạn là bao gồm, _nhưng các giới hạn được sắp xếp_. Nếu tham số "GMT" được chỉ định, thời gian được lấy theo giờ GMT. Nếu không, múi giờ cục bộ được sử dụng.

> [!WARNING]
> _Thứ tự các ngày quan trọng_.
> Trước Firefox 49, `weekdayRange("SUN", "SAT")` sẽ luôn đánh giá là `true`.
> Bây giờ `weekdayRange("WED", "SUN")` chỉ đánh giá là `true`
> nếu ngày hiện tại là Thứ Tư hoặc Chủ Nhật.

#### Ví dụ

```js-nolint
weekdayRange("MON", "FRI") // returns true Monday through Friday (local timezone)
weekdayRange("MON", "FRI", "GMT") // returns true Monday through Friday (GMT timezone)
weekdayRange("SAT") // returns true on Saturdays local time
weekdayRange("SAT", "GMT") // returns true on Saturdays GMT time
weekdayRange("FRI", "MON") // returns true Friday and Monday only (note, the order does matter!)
```

### dateRange()

#### Cú pháp

```js-nolint
dateRange(dayOrMonthOrYear)
dateRange(dayOrMonthOrYear, gmt)  // ambiguity is resolved by assuming year is greater than 31
dateRange(day1, day2)
dateRange(day1, day2, gmt)
dateRange(month1, month2)
dateRange(month1, month2, gmt)
dateRange(year1, year2)
dateRange(year1, year2, gmt)
dateRange(day1, month1, day2, month2)
dateRange(day1, month1, day2, month2, gmt)
dateRange(month1, year1, month2, year2)
dateRange(month1, year1, month2, year2, gmt)
dateRange(day1, month1, year1, day2, month2, year2)
dateRange(day1, month1, year1, day2, month2, year2, gmt)
```

> [!NOTE]
> (Trước Firefox 49) day1 phải nhỏ hơn day2, month1 phải nhỏ hơn month2, và year1 phải nhỏ hơn year2 nếu bạn muốn hàm đánh giá các tham số này như một phạm vi. Xem cảnh báo bên dưới.

#### Tham số

- day
  - : Là ngày được sắp xếp trong tháng từ 1 đến 31 (dưới dạng số nguyên).
- month
  - : Là một trong các chuỗi tháng được sắp xếp: `"JAN"`, `"FEB"`, `"MAR"`, `"APR"`, `"MAY"`, `"JUN"`, `"JUL"`, `"AUG"`, `"SEP"`, `"OCT"`, `"NOV"`, `"DEC"`.
- year
  - : Là số nguyên năm đầy đủ được sắp xếp. Ví dụ: 2016 (**không** phải 16).
- gmt
  - : Là chuỗi "GMT", làm cho so sánh thời gian xảy ra theo múi giờ GMT, hoặc được bỏ qua. Nếu không được chỉ định, thời gian được lấy theo múi giờ cục bộ.

Nếu chỉ có một giá trị được chỉ định (từ mỗi danh mục: ngày, tháng, năm), hàm chỉ trả về giá trị true vào những ngày khớp với thông số kỹ thuật đó. Nếu cả hai giá trị đều được chỉ định, kết quả là true giữa những thời điểm đó, bao gồm các giới hạn, _nhưng các giới hạn được sắp xếp_.

> [!WARNING]
> **Thứ tự các ngày, tháng và năm quan trọng**. Trước Firefox 49, `dateRange("JAN", "DEC")` sẽ luôn đánh giá là `true`. Bây giờ `dateRange("DEC", "JAN")` chỉ đánh giá true nếu tháng hiện tại là Tháng 12 hoặc Tháng 1.

#### Ví dụ

```js-nolint
dateRange(1) // returns true on the first day of each month, local timezone
dateRange(1, "GMT") // returns true on the first day of each month, GMT timezone
dateRange(1, 15) // returns true on the first half of each month
dateRange(24, "DEC");// returns true on 24th of December each year
dateRange("JAN", "MAR"); // returns true on the first quarter of the year

dateRange(1, "JUN", 15, "AUG");
// returns true from June 1st until August 15th, each year
// (including June 1st and August 15th)

dateRange(1, "JUN", 1995, 15, "AUG", 1995);
// returns true from June 1st, 1995, until August 15th, same year

dateRange("OCT", 1995, "MAR", 1996);
// returns true from October 1995 until March 1996
// (including the entire month of October 1995 and March 1996)

dateRange(1995);
// returns true during the entire year of 1995

dateRange(1995, 1997);
// returns true from beginning of year 1995 until the end of year 1997
```

### timeRange()

#### Cú pháp

```js-nolint
// The full range of expansions is analogous to dateRange.
timeRange(hour1, min1, sec1, hour2, min2, sec2)
timeRange(hour1, min1, sec1, hour2, min2, sec2, gmt)
```

> [!NOTE]
> (Trước Firefox 49) danh mục hour1, min1, sec1 phải nhỏ hơn danh mục hour2, min2, sec2 nếu bạn muốn hàm đánh giá các tham số này như một phạm vi. Xem cảnh báo bên dưới.

#### Tham số

- hour
  - : Là giờ từ 0 đến 23. (0 là nửa đêm, 23 là 11 giờ tối.)
- min
  - : Phút từ 0 đến 59.
- sec
  - : Giây từ 0 đến 59.
- gmt
  - : Là chuỗi "GMT" cho múi giờ GMT, hoặc không được chỉ định, cho múi giờ cục bộ.

Nếu chỉ có một giá trị được chỉ định (từ mỗi danh mục: giờ, phút, giây), hàm chỉ trả về giá trị true vào những thời điểm khớp với thông số kỹ thuật đó. Nếu cả hai giá trị đều được chỉ định, kết quả là true giữa những thời điểm đó, bao gồm các giới hạn, _nhưng các giới hạn được sắp xếp_.

> [!WARNING]
> **Thứ tự giờ, phút, giây quan trọng**. Trước Firefox 49, `timeRange(0, 23)` sẽ luôn đánh giá là true. Bây giờ `timeRange(23, 0)` chỉ đánh giá true nếu giờ hiện tại là 23:00 hoặc nửa đêm.

#### Ví dụ

```js-nolint
timeRange(12); // returns true from noon to 1pm
timeRange(12, 13) // returns true from noon to 1pm
timeRange(12, "GMT") // returns true from noon to 1pm, in the GMT timezone
timeRange(9, 17) // returns true from 9am to 5pm
timeRange(8, 30, 17, 0) // returns true from 8:30am to 5:00pm
timeRange(0, 0, 0, 0, 0, 30) // returns true between midnight and 30 seconds past midnight
```

### alert()

#### Cú pháp

```js-nolint
alert(message)
```

#### Tham số

- message
  - : Chuỗi để ghi nhật ký

Ghi nhật ký thông báo trong bảng điều khiển của trình duyệt.

#### Ví dụ

```js-nolint
alert(`${host} = ${dnsResolve(host)}`) // logs the host name and its IP address
alert("Error: shouldn't reach this clause.") // log a message
```

## Ví dụ 1

### Sử dụng proxy cho mọi thứ ngoại trừ máy chủ cục bộ

> [!NOTE]
> Vì tất cả các ví dụ sau đây rất cụ thể, chúng chưa được kiểm tra.

Tất cả các máy chủ không đủ điều kiện, hoặc những máy chủ trong domain cục bộ, sẽ được kết nối trực tiếp. Mọi thứ khác sẽ đi qua `w3proxy.mozilla.org:8080`. Nếu proxy ngừng hoạt động, các kết nối tự động trở thành trực tiếp:

```js
function FindProxyForURL(url, host) {
  if (isPlainHostName(host) || dnsDomainIs(host, ".mozilla.org")) {
    return "DIRECT";
  }
  return "PROXY w3proxy.mozilla.org:8080; DIRECT";
}
```

> [!NOTE]
> Đây là tệp autoconfig đơn giản và hiệu quả nhất cho các trường hợp chỉ có một proxy.

## Ví dụ 2

### Như trên, nhưng sử dụng proxy cho các máy chủ cục bộ nằm ngoài tường lửa

Nếu có các máy chủ (như máy chủ Web chính) thuộc domain cục bộ nhưng nằm ngoài tường lửa và chỉ có thể truy cập qua proxy server, các ngoại lệ đó có thể được xử lý bằng hàm `localHostOrDomainIs()`:

```js
function FindProxyForURL(url, host) {
  if (
    (isPlainHostName(host) || dnsDomainIs(host, ".mozilla.org")) &&
    !localHostOrDomainIs(host, "www.mozilla.org") &&
    !localHostOrDomainIs(host, "merchant.mozilla.org")
  ) {
    return "DIRECT";
  }
  return "PROXY w3proxy.mozilla.org:8080; DIRECT";
}
```

Ví dụ trên sẽ sử dụng proxy cho mọi thứ ngoại trừ các máy chủ cục bộ trong domain mozilla.org, với ngoại lệ thêm rằng các máy chủ `www.mozilla.org` và `merchant.mozilla.org` sẽ đi qua proxy.

> [!NOTE]
> Thứ tự các ngoại lệ trên để hiệu quả: `localHostOrDomainIs()` chỉ được thực thi cho các URL trong domain cục bộ, không phải cho mọi URL. Hãy chú ý đến các dấu ngoặc đơn xung quanh biểu thức _or_ trước biểu thức _and_ để đạt được hành vi hiệu quả đã đề cập.

## Ví dụ 3

### Chỉ sử dụng proxy nếu không thể phân giải máy chủ

Ví dụ này sẽ hoạt động trong môi trường nơi máy chủ DNS nội bộ được thiết lập để chỉ có thể phân giải tên máy chủ nội bộ và mục tiêu là chỉ sử dụng proxy cho các máy chủ không thể phân giải được:

```js
function FindProxyForURL(url, host) {
  if (isResolvable(host)) {
    return "DIRECT";
  }
  return "PROXY proxy.example.com:8080";
}
```

Ví dụ trên yêu cầu tham khảo DNS mỗi lần; nó có thể được nhóm thông minh với các quy tắc khác để DNS chỉ được tham khảo nếu các quy tắc khác không cho kết quả:

```js
function FindProxyForURL(url, host) {
  if (
    isPlainHostName(host) ||
    dnsDomainIs(host, ".example.com") ||
    isResolvable(host)
  ) {
    return "DIRECT";
  }
  return "PROXY proxy.example.com:8080";
}
```

## Ví dụ 4

### Quyết định dựa trên subnet

Trong ví dụ này, tất cả các máy chủ trong một subnet nhất định được kết nối trực tiếp, các máy chủ khác được kết nối qua proxy:

```js
function FindProxyForURL(url, host) {
  if (isInNet(host, "192.0.2.172", "255.255.0.0")) {
    return "DIRECT";
  }
  return "PROXY proxy.example.com:8080";
}
```

Một lần nữa, việc sử dụng máy chủ DNS trong ví dụ trên có thể được giảm thiểu bằng cách thêm các quy tắc dư thừa vào đầu:

```js
function FindProxyForURL(url, host) {
  if (
    isPlainHostName(host) ||
    dnsDomainIs(host, ".example.com") ||
    isInNet(host, "192.0.2.0", "255.255.0.0")
  ) {
    return "DIRECT";
  }
  return "PROXY proxy.example.com:8080";
}
```

## Ví dụ 5

### Cân bằng tải/định tuyến dựa trên mẫu URL

Ví dụ này phức tạp hơn. Có bốn (4) proxy servers; một trong số chúng là dự phòng nóng cho tất cả các máy chủ còn lại, vì vậy nếu bất kỳ máy chủ còn lại nào ngừng hoạt động, máy chủ thứ tư sẽ tiếp quản. Hơn nữa, ba proxy servers còn lại chia sẻ tải dựa trên mẫu URL, làm cho việc lưu vào cache của chúng hiệu quả hơn (chỉ có một bản sao của bất kỳ tài liệu nào trên ba máy chủ - thay vì một bản sao trên mỗi máy chủ). Tải được phân phối như thế này:

| Proxy | Mục đích           |
| ----- | ------------------ |
| #1    | Domain .com        |
| #2    | Domain .edu        |
| #3    | Tất cả domain khác |
| #4    | Dự phòng nóng      |

Tất cả truy cập cục bộ đều được thực hiện trực tiếp. Tất cả proxy servers chạy trên cổng 8080 (chúng không cần phải như vậy, bạn có thể thay đổi cổng của mình nhưng hãy nhớ sửa đổi cấu hình của bạn ở cả hai phía). Lưu ý cách chuỗi có thể được nối với toán tử **`+`** trong JavaScript.

```js
function FindProxyForURL(url, host) {
  if (isPlainHostName(host) || dnsDomainIs(host, ".example.com")) {
    return "DIRECT";
  } else if (shExpMatch(host, "*.com")) {
    return "PROXY proxy1.example.com:8080; PROXY proxy4.example.com:8080";
  } else if (shExpMatch(host, "*.edu")) {
    return "PROXY proxy2.example.com:8080; PROXY proxy4.example.com:8080";
  }
  return "PROXY proxy3.example.com:8080; PROXY proxy4.example.com:8080";
}
```

## Ví dụ 6

### Đặt proxy cho giao thức cụ thể

Hầu hết các chức năng JavaScript tiêu chuẩn đều có sẵn để sử dụng trong hàm `FindProxyForURL()`. Ví dụ: để đặt các proxy khác nhau dựa trên giao thức, hàm {{jsxref("String.prototype.startsWith()", "startsWith()")}} có thể được sử dụng:

```js
function FindProxyForURL(url, host) {
  if (url.startsWith("http:")) {
    return "PROXY http-proxy.example.com:8080";
  } else if (url.startsWith("ftp:")) {
    return "PROXY ftp-proxy.example.com:8080";
  } else if (url.startsWith("gopher:")) {
    return "PROXY gopher-proxy.example.com:8080";
  } else if (url.startsWith("https:") || url.startsWith("snews:")) {
    return "PROXY security-proxy.example.com:8080";
  }
  return "DIRECT";
}
```

> [!NOTE]
> Điều tương tự có thể được thực hiện bằng cách sử dụng hàm [`shExpMatch()`](#shexpmatch) được mô tả trước đó.

Ví dụ:

```js
if (shExpMatch(url, "http:*")) {
  return "PROXY http-proxy.example.com:8080";
}
```

> [!NOTE]
> Tệp autoconfig có thể được xuất ra bởi script CGI. Điều này hữu ích, ví dụ: khi làm cho tệp autoconfig hoạt động khác nhau dựa trên địa chỉ IP của client (biến môi trường `REMOTE_ADDR` trong CGI).
>
> Việc sử dụng các hàm `isInNet()`, `isResolvable()` và `dnsResolve()` nên được xem xét cẩn thận, vì chúng yêu cầu máy chủ DNS được tham khảo. Tất cả các hàm liên quan đến autoconfig khác là các hàm khớp chuỗi thuần túy không yêu cầu sử dụng máy chủ DNS. Nếu proxy được sử dụng, proxy sẽ thực hiện tra cứu DNS của nó, điều này sẽ tăng gấp đôi tác động lên máy chủ DNS. Hầu hết thời gian các hàm này không cần thiết để đạt được kết quả mong muốn.

## Lịch sử và triển khai

Proxy auto-config được giới thiệu vào Netscape Navigator 2.0 vào cuối những năm 1990, cùng lúc JavaScript được giới thiệu. Open-sourcing Netscape cuối cùng dẫn đến chính Firefox.

Triển khai "gốc" nhất của PAC và các thư viện JavaScript của nó do đó là `nsProxyAutoConfig.js` được tìm thấy trong các phiên bản đầu của Firefox. Các tiện ích này được tìm thấy trong nhiều hệ thống open-source khác bao gồm [Chromium](https://source.chromium.org/chromium/chromium/src/+/main:services/proxy_resolver/pac_js_library.h). Firefox sau đó đã tích hợp tệp vào [`ProxyAutoConfig.cpp`](https://searchfox.org/firefox-main/source/netwerk/base/ProxyAutoConfig.cpp) như một ký tự chuỗi C++. Để trích xuất nó vào tệp riêng của nó, chỉ cần sao chép đoạn vào JavaScript với chỉ thị `console.log` để in nó.

Microsoft nói chung đã tạo ra triển khai riêng của họ. Trước đây có [một số vấn đề với thư viện của họ](https://en.wikipedia.org/wiki/Proxy_auto-config#Old_Microsoft_problems), nhưng hầu hết đã được giải quyết bây giờ. Họ đã định nghĩa [một số hàm mới có hậu tố "Ex"](https://learn.microsoft.com/en-us/windows/win32/winhttp/ipv6-extensions-to-navigator-auto-config-file-format) xung quanh các phần xử lý địa chỉ để hỗ trợ IPv6. Tính năng này được hỗ trợ bởi Chromium, nhưng chưa bởi Firefox ([bugzilla #558253](https://bugzil.la/558253)).

## Xem thêm

- {{glossary("Proxy server")}}
- [Loại MIME (loại phương tiện IANA)](/en-US/docs/Web/HTTP/Guides/MIME_types)
- [Automatic proxy HTTP server configuration in web browsers](https://jdebp.uk/FGA/web-browser-auto-proxy-configuration.html)
