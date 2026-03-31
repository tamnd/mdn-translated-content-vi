---
title: Browser detection using the user agent string (UA sniffing)
short-title: Browser detection using the UA string
slug: Web/HTTP/Guides/Browser_detection_using_the_user_agent
page-type: guide
sidebar: http
---

Cùng với mỗi yêu cầu đến máy chủ, trình duyệt đính kèm header {{HTTPHeader("User-Agent")}} {{Glossary("HTTP")}} với một giá trị được gọi là chuỗi {{glossary("user agent")}} (UA).
Chuỗi này được thiết kế để xác định trình duyệt, số phiên bản của nó và hệ điều hành chủ.

```http
User-Agent: <product> / <product-version> <comment>
```

Bạn cũng có thể truy cập chuỗi này thông qua thuộc tính [`navigator.userAgent`](/en-US/docs/Web/API/Navigator/userAgent) trong JavaScript:

```js
console.log(window.navigator.userAgent);
// Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0
```

Có thể rất hấp dẫn khi phân tích chuỗi UA (đôi khi được gọi là "UA sniffing") và thay đổi hành vi trang web của bạn dựa trên các giá trị trong chuỗi UA, nhưng điều này rất khó thực hiện một cách đáng tin cậy và thường là nguyên nhân gây ra lỗi.

Tài liệu này mô tả các sai lầm phổ biến khi sử dụng chuỗi UA để phát hiện trình duyệt và các giải pháp thay thế được khuyến nghị.
Ở cuối, chúng tôi cung cấp một số gợi ý để phát hiện UA bằng chuỗi, nhưng bạn chỉ nên làm điều này khi thực sự cần thiết!

## Tại sao phát hiện tính năng tốt hơn phát hiện trình duyệt

Để minh họa lý do tại sao việc cố gắng điều chỉnh chức năng trang web theo trình duyệt lại tạo ra sự phức tạp và các lỗi có thể xảy ra, hãy xem xét ví dụ sau.
Một ứng dụng muốn sử dụng hàm `splitUpString()` trong JavaScript bằng cách sử dụng [lookbehind assertion](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion) (`?<=…`):

```js example-bad
let splitUpString;

if (navigator.userAgent.includes("Chrome")) {
  const camelCaseExpression = new RegExp("(?<=[A-Z])");
  splitUpString = (str) => String(str).split(camelCaseExpression);
} else {
  // This fallback is inefficient, but it works
  splitUpString = (str) =>
    String(str)
      .split(/(.*?[A-Z])/)
      .filter(Boolean);
}
console.log(splitUpString("fooBar")); // ["fooB", "ar"]
console.log(splitUpString("jQWhy")); // ["jQ", "W", "hy"]
```

Đoạn mã này đưa ra một số giả định có thể sai, và sẽ làm hỏng mã nếu nó được chạy trên trình duyệt hoặc phiên bản trình duyệt không phù hợp:

1. Tất cả các chuỗi user agent bao gồm chuỗi con `Chrome` đều chỉ ra trình duyệt Chrome.

   Một trong những vấn đề lớn nhất với việc phát hiện trình duyệt dựa trên chuỗi UA là các trình duyệt và user agent thường xuyên giả vờ là một trình duyệt khác, hoặc bao gồm thông tin dựa trên nhiều trình duyệt.

2. Tính năng lookbehind luôn có sẵn nếu trình duyệt là Chrome.
   Trên thực tế, trình duyệt có thể là phiên bản Chrome cũ hơn trước khi hỗ trợ được thêm vào, hoặc có thể là phiên bản Chrome mới hơn đã loại bỏ nó.
3. Quan trọng nhất, nó giả định không có trình duyệt nào khác hỗ trợ tính năng này, trong khi nó có thể được thêm vào bất kỳ trình duyệt nào khác bất cứ lúc nào.
   Tất cả các trình duyệt không khớp sẽ bị mắc kẹt với một phương án dự phòng không hiệu quả.

Điều quan trọng cần lưu ý là những vấn đề này sẽ tồn tại bất kể phương pháp phát hiện trình duyệt nào; UA sniffing, client hints, sự hiện diện, vắng mặt hoặc nội dung của các HTTP header khác, v.v.
Biết trình duyệt nào được sử dụng là không liên quan, điều chúng ta thực sự tìm kiếm trong trường hợp này là phát hiện tính năng, được mô tả chi tiết hơn bên dưới.

## Các giải pháp thay thế cho UA sniffing

Các phần sau đây mô tả các giải pháp thay thế cho việc phát hiện trình duyệt mạnh mẽ hơn và có thể áp dụng trong nhiều tình huống hơn so với UA sniffing.

### Phát hiện tính năng

Phát hiện tính năng là nơi bạn kiểm tra xem một tính năng cụ thể có sẵn cho client hay không thay vì tìm hiểu trình duyệt nào đang hiển thị trang của bạn.
Đối với các trường hợp tính năng không được hỗ trợ, bạn sử dụng phương án dự phòng thay thế.
Ví dụ phát hiện tính năng sau đây kiểm tra xem client có hỗ trợ {{domxref("Geolocation_API", "Geolocation API", "", "nocode")}} hay không.
Bạn có thể làm điều này bằng cách kiểm tra thuộc tính `geolocation` có sẵn trên đối tượng toàn cục {{domxref("Navigator")}}.

```js
if ("geolocation" in navigator) {
  navigator.geolocation.getCurrentPosition((position) => {
    // show the location on a map, such as the Google Maps API
  });
} else {
  // Show a static map instead
}
```

Bạn có thể làm điều này cho nhiều tính năng.
Ví dụ, bạn có thể xác định xem các tệp PDF có thể được xem inline hay không, hoặc liệu {{domxref("VirtualKeyboard_API", "VirtualKeyboard API", "", "nocode")}} có được hỗ trợ hay không, v.v.:

```js
if ("application/pdf" in navigator.mimeTypes) {
  // browser supports inline viewing of PDF files.
}
if ("virtualKeyboard" in navigator) {
  // browser supports the Virtual Keyboard API
}
```

Đối với các style, bạn cũng có thể phát hiện tính năng trong CSS bằng cách sử dụng at-rule {{cssxref("@supports")}}, kết hợp với từ khóa `not` nếu bạn muốn kiểm tra sự vắng mặt của một tính năng.
Xem [Sử dụng feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries) để biết thông tin về cách sử dụng điều này trong CSS.

```css
@supports (display: grid) {
  .box {
    display: grid;
    gap: 2rem;
  }
}

@supports not (property: value) {
  /* CSS rules for fallback */
}
```

Trong các trường hợp hiếm gặp khi hành vi khác nhau giữa các trình duyệt cho một tính năng, bạn nên kiểm tra cách các trình duyệt triển khai API và xác định cách sử dụng nó dựa trên đó.
Để tìm hiểu thêm, hãy xem tài liệu [Triển khai phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection).

#### Phát hiện thiết bị di động

Một cách sử dụng sai phổ biến của UA sniffing (và [client hints](#client_hints)) là phát hiện xem client có phải là thiết bị di động hay không.
Thường thì mọi người thực sự muốn phát hiện xem thiết bị của người dùng có **hỗ trợ cảm ứng** và có màn hình nhỏ hay không để họ có thể tối ưu hóa trang web của mình bằng cách thêm padding thêm vào các nút, ví dụ.

Thay vào đó, bạn nên phát hiện tính năng bằng cách sử dụng các API hiện đại.
Ví dụ, để kiểm tra hỗ trợ cảm ứng, hãy thử thuộc tính [maxTouchPoints](/en-US/docs/Web/API/Navigator/maxTouchPoints) trong giao diện {{domxref("Navigator")}}:

```js
if (navigator.maxTouchPoints > 1) {
  // browser supports multi-touch
}
```

Đối với các vấn đề khác như bố cục, hãy sử dụng CSS hiện đại như [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) và [grid](/en-US/docs/Web/CSS/Guides/Grid_layout) cho bố cục linh hoạt.
Thay vì ẩn nội dung trên màn hình nhỏ hơn, hãy điều chỉnh bố cục một cách linh hoạt.
[Media queries](/en-US/docs/Web/CSS/Guides/Media_queries) nên xử lý hầu hết các thay đổi bố cục, giảm nhu cầu điều chỉnh dựa trên JavaScript.

Nếu bạn muốn đảm bảo các chuyển đổi mượt mà khi người dùng xoay thiết bị của họ hoặc chuyển đổi giữa các chế độ màn hình khác nhau, bạn có thể xem xét [Phát hiện hướng thiết bị](/en-US/docs/Web/API/Device_orientation_events/Detecting_device_orientation).
Đối với các thiết bị gấp, có các API mới hơn như [Device Posture API](/en-US/docs/Web/API/Device_Posture_API), mặc dù hãy chắc chắn kiểm tra dữ liệu tương thích vì hỗ trợ thay đổi rộng rãi.

### Client hints

Đối với các trình duyệt dựa trên Blink (Chromium, Edge, Brave, Vivaldi, v.v.), một giải pháp thay thế là [User agent client hints](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints).
Trong client hints, máy chủ chủ động yêu cầu thông tin thiết bị từ client thông qua HTTP header hoặc thông qua [JavaScript API](/en-US/docs/Web/API/User-Agent_Client_Hints_API).

Client hints tốt hơn UA sniffing để phát hiện các trình duyệt dựa trên Blink vì chúng không bị giả mạo phổ biến, và chúng cung cấp các thông tin nhỏ hơn, đáng tin cậy hơn và dễ phân tích hơn.
Việc thay đổi chức năng trang web dựa trên client hints vẫn là một ý tưởng tồi!
Nếu có thể, bạn nên sử dụng phát hiện tính năng và progressive enhancement [như được mô tả ở trên](#why_feature_detection_is_better_than_browser_detection).

Ví dụ, trong cơ chế HTTP, máy chủ bao gồm header {{httpheader("Accept-CH")}} cùng với danh sách các header nên được bao gồm bởi client trong các yêu cầu tiếp theo.
Giả sử máy chủ gửi phản hồi này cho client:

```http
Accept-CH: Sec-CH-UA-Mobile, Sec-CH-UA-Platform, Sec-CH-UA
```

Điều này yêu cầu các header sau từ client trong các yêu cầu tiếp theo:

- {{httpheader("Sec-CH-UA-Mobile")}}: một boolean để chỉ ra liệu client có phải là thiết bị di động hay không.
- {{httpheader("Sec-CH-UA-Platform")}}: nền tảng mà client đang hoạt động ("Windows", "Android", v.v.).
- {{httpheader("Sec-CH-UA")}}: thông tin nhãn hiệu và phiên bản đáng kể của user-agent.

Giả sử client hỗ trợ client hints, các UA client hints có thể xuất hiện trong các yêu cầu tiếp theo:

```http
GET /my/page HTTP/1.1
Host: example.site

Sec-CH-UA: " Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"
Sec-CH-UA-Mobile: ?1
Sec-CH-UA-Platform: "Android"
```

Để tìm hiểu thêm về client hints, hãy xem [HTTP Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints).
Hãy chắc chắn kiểm tra chi tiết [Khả năng tương thích trình duyệt](/en-US/docs/Web/HTTP/Reference/Headers/Accept-CH#browser_compatibility) để biết thêm thông tin trước khi sử dụng tính năng này.

### Các kỹ thuật và nguyên tắc khác

- {{glossary("Progressive enhancement")}}
  - : Kỹ thuật thiết kế này liên quan đến việc phát triển trang web của bạn theo 'các lớp', sử dụng phương pháp từ dưới lên, bắt đầu với một lớp đơn giản hơn và cải thiện khả năng của trang web trong các lớp kế tiếp, mỗi lớp sử dụng nhiều tính năng hơn.
- {{glossary("Graceful degradation")}}
  - : Đây là phương pháp từ trên xuống trong đó bạn xây dựng trang web tốt nhất có thể sử dụng tất cả các tính năng bạn muốn, sau đó điều chỉnh nó để làm cho nó hoạt động trên các trình duyệt cũ hơn. Điều này có thể khó thực hiện hơn và ít hiệu quả hơn so với progressive enhancement, nhưng có thể hữu ích trong một số trường hợp.

## Lý do không hợp lệ để sử dụng phát hiện trình duyệt

Nếu bạn vẫn đang xem xét phát hiện trình duyệt thay vì phát hiện tính năng và progressive enhancement, hãy kiểm tra xem bạn có bị thúc đẩy bởi các lý do (không hợp lệ) sau hay không:

- **Bạn đang cố gắng khắc phục một lỗi cụ thể trong một phiên bản trình duyệt nhất định**
  - : Bạn khó có khả năng là người đầu tiên gặp phải nó.
    Các chuyên gia hoặc người có quan điểm khác có thể cung cấp cho bạn gợi ý để tránh hoặc khắc phục lỗi tốt hơn.
    Nếu vấn đề không phổ biến, đáng để kiểm tra xem lỗi này đã được báo cáo cho nhà cung cấp trình duyệt thông qua hệ thống theo dõi lỗi chưa ([Mozilla](https://bugzilla.mozilla.org/); [WebKit](https://bugs.webkit.org/); [Blink](https://www.chromium.org/issue-tracking/); [Opera](https://bugs.opera.com/)).
    Các nhà sản xuất trình duyệt chú ý đến báo cáo lỗi, và của bạn có thể giúp sửa hoặc cung cấp các giải pháp thay thế đáng tin cậy hơn cho một vấn đề.
- **Phục vụ HTML khác nhau tùy thuộc vào trình duyệt của khách truy cập**
  - : Đây thường là một ý tưởng tồi, nhưng có những trường hợp hiếm gặp khi điều này là cần thiết.
    Bạn có thể ngăn điều này bằng cách thêm các phần tử {{ HTMLElement("div") }} hoặc {{ HTMLElement("span") }} không có ngữ nghĩa không?
    Hãy xem xét xem thực sự có vấn đề gì với thiết kế của bạn không: bạn có thể sử dụng progressive enhancement hoặc bố cục linh hoạt để giúp loại bỏ nhu cầu làm điều này không?
    Nỗ lực trong việc áp dụng phát hiện UA chính xác so với việc làm lại HTML của bạn nên là yếu tố quyết định.
- **Cố gắng tìm hiểu xem trình duyệt của khách truy cập có một tính năng cụ thể hay không**
  - : Trang web của bạn cần sử dụng một tính năng cụ thể mà một số trình duyệt chưa hỗ trợ, và bạn muốn người dùng với các trình duyệt không tương thích được phục vụ một trang web cũ hơn với ít tính năng hơn mà bạn biết sẽ hoạt động.
    Đây là lý do tồi nhất để sử dụng phát hiện UA vì tất cả các trình duyệt cuối cùng sẽ bắt kịp.
    Ngoài ra, không thực tế khi kiểm tra từng trình duyệt cho các tính năng khác nhau theo cách này.

## Trích xuất các phần chuỗi UA liên quan

Nếu bạn đã khám phá tất cả các tùy chọn ở trên, và bạn vẫn cần phân tích chuỗi UA như biện pháp cuối cùng, có một số gợi ý trong phần này sẽ giúp bạn.
Thật không may, không có tính đồng nhất của các phần khác nhau của chuỗi user agent, vì vậy chúng ta đã đến phần khó khăn.

### Rendering engine

Các trình duyệt chia sẻ {{glossary("engine/rendering", "rendering engine")}} chung sẽ hiển thị một trang theo cách giống nhau: thường là một giả định hợp lý rằng những gì hoạt động trong một trình duyệt sẽ hoạt động trong trình duyệt kia.
Có ba rendering engine chính đang hoạt động: {{glossary("Blink")}}, {{glossary("Gecko")}}, và {{glossary("WebKit")}}.

Rendering engine là chuỗi `Gecko/20100101` trong ví dụ sau, cho biết rendering engine là `Gecko`, và "gecko-Trail" là chuỗi cố định `20100101`, có nghĩa là "desktop":

```http
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0
```

Việc phát hiện tên rendering engine phổ biến trên các trang web, và nhiều user agent trong lịch sử đã thêm các tên rendering khác để tránh các trang web chặn họ dựa trên tên rendering engine.
Do đó, điều quan trọng là phải chú ý không kích hoạt các dương tính giả khi phát hiện rendering engine, vì phương pháp này đặc biệt không đáng tin cậy.
Hãy xem xét chuỗi UA sau được gửi trong Chrome 134 trên macOS:

```http
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36
```

| Engine   | Phải chứa         | Chi tiết                                                                                                                                                   |
| -------- | ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Blink    | `Chrome/xyz`      |                                                                                                                                                            |
| Gecko    | `Gecko/xyz`       |                                                                                                                                                            |
| WebKit   | `AppleWebKit/xyz` | Các trình duyệt WebKit thêm chuỗi `like Gecko` có thể kích hoạt dương tính giả cho Gecko nếu việc phát hiện không được áp dụng cẩn thận. |
| Presto   | `Opera/xyz`       | Lỗi thời; Presto không còn được sử dụng trong các bản dựng trình duyệt Opera >= phiên bản 15 (xem 'Blink')                                                 |
| EdgeHTML | `Edge/xyz`        | Lỗi thời; EdgeHTML không còn được sử dụng trong các bản dựng trình duyệt Edge >= phiên bản 79 (xem 'Blink').                                               |

### Phiên bản rendering engine

Hầu hết các rendering engine đặt số phiên bản trong token `RenderingEngine/VersionNumber`, với ngoại lệ đáng chú ý là Gecko.
Đó là chuỗi `rv:138.0` trong ví dụ sau, có nghĩa là số phiên bản rendering engine là `138.0`, giống với phiên bản Firefox:

```http
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0
```

### Tên và phiên bản trình duyệt

Khi mọi người nói họ muốn "phát hiện trình duyệt", họ thực sự thường muốn "phát hiện rendering engine".
Điều đó thường có nghĩa là phát hiện "Gecko" hoặc "WebKit" thay vì "Firefox" hoặc "Safari".

Hầu hết các trình duyệt đặt tên và phiên bản theo định dạng `BrowserName/VersionNumber`.
Nhưng vì tên không phải là thông tin duy nhất trong chuỗi user agent ở định dạng đó, bạn không thể khám phá tên của trình duyệt, bạn chỉ có thể kiểm tra xem tên bạn đang tìm kiếm có hiện diện hay không.
Tên trình duyệt là chuỗi `Firefox/138.0` trong ví dụ sau, cho biết tên trình duyệt là `Firefox`, và phiên bản phần mềm là `138.0`:

```http
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0
```

Một số trình duyệt gửi thông tin xung đột: Chrome, ví dụ, báo cáo cả Chrome và Safari.
Vì vậy để phát hiện Safari, bạn phải kiểm tra chuỗi Safari và sự vắng mặt của chuỗi Chrome, Chromium thường báo cáo chính mình là Chrome và SeaMonkey báo cáo chính mình là Firefox.

Hãy cẩn thận khi sử dụng regular expression trên phần `BrowserName` vì user agent cũng chứa các chuỗi xung quanh cú pháp Keyword/Value.
Safari & Chrome chứa chuỗi `like Gecko`, ví dụ.

| Tên trình duyệt                 | Phải chứa       | Không được chứa                |
| ------------------------------- | --------------- | ------------------------------ |
| Firefox                         | `Firefox/xyz`   | `Seamonkey/xyz`                |
| Seamonkey                       | `Seamonkey/xyz` |                                |
| Chrome                          | `Chrome/xyz`    | `Chromium/xyz` hoặc `Edg.*/xyz` |
| Chromium                        | `Chromium/xyz`  |                                |
| Safari                          | `Safari/xyz` \* | `Chrome/xyz` hoặc `Chromium/xyz` |
| Opera 15+ (engine dựa trên Blink)  | `OPR/xyz`       |                                |
| Opera 12- (engine dựa trên Presto) | `Opera/xyz`     |                                |

\* Safari cung cấp hai số phiên bản: một số kỹ thuật trong token `Safari/xyz`, và một số thân thiện với người dùng trong token `Version/xyz`.

Tất nhiên, hoàn toàn không có gì đảm bảo rằng một trình duyệt khác sẽ không giả mạo những điều này trong một số trường hợp.
Đó là lý do tại sao việc phát hiện trình duyệt bằng chuỗi user agent không đáng tin cậy và chỉ nên được thực hiện với việc kiểm tra số phiên bản (việc giả mạo các phiên bản trước ít khả năng xảy ra hơn).

### Phát hiện hệ điều hành

Hệ điều hành được gửi trong hầu hết các chuỗi UA (mặc dù không phải các nền tảng tập trung vào web), nhưng định dạng thay đổi.
Đó là một chuỗi cố định giữa hai dấu chấm phẩy, trong phần chú thích của User Agent và các chuỗi này là đặc thù cho mỗi trình duyệt.

Chúng cho biết hệ điều hành, và thường là phiên bản của nó và thông tin về phần cứng phụ thuộc (32 hoặc 64 bit, Intel/PPC cho Mac, hoặc kiến trúc CPU x86/ARM cho PC Windows).
Đó là chuỗi `Intel Mac OS X 10.15` trong ví dụ sau:

```http
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:138.0) Gecko/20100101 Firefox/138.0
```

Trong tất cả các trường hợp, các chuỗi này có thể thay đổi, vì vậy bạn chỉ nên sử dụng chúng kết hợp với việc phát hiện các trình duyệt đã được phát hành để các mẫu được biết trước.
Hãy xem xét khảo sát khách truy cập hoặc chuỗi UA để điều chỉnh mã của bạn khi các phiên bản trình duyệt mới được phát hành.

### Di động, Máy tính bảng hay Máy tính để bàn

Lý do phổ biến nhất để thực hiện UA sniffing là xác định loại thiết bị nào trình duyệt đang chạy trên.

- Đừng bao giờ giả định rằng một trình duyệt hoặc rendering engine chỉ chạy trên một loại thiết bị.
  Đặc biệt, đừng dựa vào các mặc định khác nhau cho các trình duyệt hoặc rendering engine khác nhau.
- Đừng bao giờ sử dụng token OS để xác định xem trình duyệt có đang trên di động, máy tính bảng hay máy tính để bàn hay không.
  Hệ điều hành có thể chạy trên nhiều loại thiết bị (ví dụ, Android chạy trên cả máy tính bảng và điện thoại).

Bảng sau đây tóm tắt cách các nhà cung cấp trình duyệt phổ biến chỉ ra rằng trình duyệt của họ đang chạy trên thiết bị di động:

| Trình duyệt                                                       | Quy tắc                                                                | Ví dụ                                                                                                                                                            |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Mozilla (Gecko, Firefox)                                          | `Mobile` hoặc `Tablet` bên trong chú thích.                            | `Mozilla/5.0 (Android 15; Mobile; rv:136.0) Gecko/136.0 Firefox/136.0`                                                                                           |
| WebKit-based (Android, Safari)                                    | Token `Mobile Safari` bên ngoài chú thích.                             | `Mozilla/5.0 (Linux; U; Android 4.0.3; de-ch; HTC Sensation Build/IML74K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30`               |
| Blink-based (Chromium, Google Chrome, Opera 15+, Edge on Android) | Token `Mobile Safari` bên ngoài chú thích.                             | `Mozilla/5.0 (Linux; Android 4.4.2; Nexus 5 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.117 Mobile Safari/537.36 OPR/20.0.1396.72047`  |
| Edge on Windows 10 Mobile                                         | Token `Mobile/xyz` và `Edge/` bên ngoài chú thích.                     | `Mozilla/5.0 (Windows Phone 10.0; Android 6.0.1; Xbox; Xbox One) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Mobile Safari/537.36 Edge/16.16299` |

Nói ngắn gọn, bạn có thể tìm kiếm chuỗi `Mobi` ở bất kỳ đâu trong chuỗi UA.
Nếu thiết bị đủ lớn mà nó không được đánh dấu với `Mobi`, bạn nên phục vụ trang web desktop của mình (trang web này, như một thực hành tốt nhất, nên hỗ trợ đầu vào cảm ứng dù sao, vì các thiết bị desktop có thể có màn hình cảm ứng).

## Xem thêm

- [CSS Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- [HTTP Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [Triển khai phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection)
- [Migrate to User-Agent Client Hints](https://web.dev/articles/migrate-to-ua-ch#strategy_legacy_support) trên web.dev (2021)
