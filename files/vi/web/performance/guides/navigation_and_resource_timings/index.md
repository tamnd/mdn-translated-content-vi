---
title: Điều hướng và thời gian tài nguyên
slug: Web/Performance/Guides/Navigation_and_resource_timings
page-type: guide
sidebar: performancesidebar
---

**Định thời điều hướng** là các chỉ số đo sự kiện điều hướng tài liệu của trình duyệt. **Định thời tài nguyên** là các phép đo thời gian mạng chi tiết liên quan đến việc tải tài nguyên của một ứng dụng. Cả hai đều cung cấp cùng các thuộc tính chỉ đọc, nhưng định thời điều hướng đo thời gian của tài liệu chính, còn định thời tài nguyên cung cấp thời gian cho mọi tài sản hoặc tài nguyên mà tài liệu chính đó gọi tới và các tài nguyên được các tài nguyên đó yêu cầu.

Các mốc thời gian hiệu năng tổng quát bên dưới đã bị loại bỏ để thay thế bằng API mục nhập hiệu năng, API này cho phép đánh dấu và đo thời gian trong suốt quá trình điều hướng và tải tài nguyên. Dù đã bị loại bỏ, chúng vẫn được hỗ trợ trong mọi trình duyệt.

## Các mốc thời gian hiệu năng

[PerformanceTiming API](/en-US/docs/Web/API/PerformanceTiming), một API JavaScript dùng để đo hiệu năng tải của trang được yêu cầu, đã bị loại bỏ nhưng vẫn được hỗ trợ trong mọi trình duyệt. Nó đã được thay thế bằng API [PerformanceNavigationTiming](/en-US/docs/Web/API/PerformanceNavigationTiming).

Performance timing API cung cấp các thời điểm chỉ đọc, tính bằng mili giây (ms), mô tả từng mốc trong quá trình tải trang đã được đạt tới vào thời điểm nào. Như được hiển thị trong hình bên dưới, quá trình điều hướng đi qua [`navigationStart`](/en-US/docs/Web/API/PerformanceTiming/navigationStart), [`unloadEventStart`](/en-US/docs/Web/API/PerformanceTiming/unloadEventStart), [`unloadEventEnd`](/en-US/docs/Web/API/PerformanceTiming/unloadEventEnd), [`redirectStart`](/en-US/docs/Web/API/PerformanceTiming/redirectStart), [`redirectEnd`](/en-US/docs/Web/API/PerformanceTiming/redirectEnd), [`fetchStart`](/en-US/docs/Web/API/PerformanceTiming/fetchStart), [`domainLookupStart`](/en-US/docs/Web/API/PerformanceTiming/domainLookupStart), [`domainLookupEnd`](/en-US/docs/Web/API/PerformanceTiming/domainLookupEnd), [`connectStart`](/en-US/docs/Web/API/PerformanceTiming/connectStart), [`connectEnd`](/en-US/docs/Web/API/PerformanceTiming/connectEnd), [`secureConnectionStart`](/en-US/docs/Web/API/PerformanceTiming/secureConnectionStart), [`requestStart`](/en-US/docs/Web/API/PerformanceTiming/requestStart), [`responseStart`](/en-US/docs/Web/API/PerformanceTiming/responseStart), [`responseEnd`](/en-US/docs/Web/API/PerformanceTiming/responseEnd), [`domLoading`](/en-US/docs/Web/API/PerformanceTiming/domLoading), [`domInteractive`](/en-US/docs/Web/API/PerformanceTiming/domInteractive), [`domContentLoadedEventStart`](/en-US/docs/Web/API/PerformanceTiming/domContentLoadedEventStart), [`domContentLoadedEventEnd`](/en-US/docs/Web/API/PerformanceTiming/domContentLoadedEventEnd), [`domComplete`](/en-US/docs/Web/API/PerformanceTiming/domComplete), [`loadEventStart`](/en-US/docs/Web/API/PerformanceTiming/loadEventStart) và [`loadEventEnd`](/en-US/docs/Web/API/PerformanceTiming/loadEventEnd).

![Các chỉ số sự kiện Navigation Timing](screen_shot_2019-05-03_at_1.06.27_pm.png)

Từ các chỉ số ở trên, cộng thêm một chút toán học, chúng ta có thể tính nhiều chỉ số quan trọng như [thời gian đến byte đầu tiên](/en-US/docs/Glossary/Time_to_first_byte), thời gian tải trang, tra cứu DNS và việc kết nối có an toàn hay không.

Để giúp đo thời gian cần thiết để hoàn tất tất cả các bước, Performance Timing API cung cấp các phép đo chỉ đọc về navigation timings. Để xem và lấy thời gian của ứng dụng, ta nhập:

```js
let time = window.performance.timing;
```

Sau đó chúng ta có thể dùng kết quả để đo ứng dụng hoạt động tốt đến mức nào.

![Nhập window.performance.timing trong console sẽ liệt kê tất cả các mốc thời gian trong giao diện PerformanceNavigationTiming](navigatortiming.png)

Thứ tự là:

<table>
  <thead>
    <tr>
      <th>Performance Timings</th>
      <th>Chi tiết</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        {{domxref("PerformanceTiming.navigationStart","navigationStart")}}
      </td>
      <td>
        Khi lời nhắc dỡ tải kết thúc trên tài liệu trước đó trong cùng ngữ cảnh
        duyệt. Nếu không có tài liệu trước đó, giá trị này sẽ giống
        <code>PerformanceTiming.fetchStart</code>.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.secureConnectionStart","secureConnectionStart")}}
      </td>
      <td>
        Khi bắt đầu bắt tay kết nối an toàn. Nếu không có kết nối như vậy được
        yêu cầu, nó trả về <code>0</code>.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.redirectStart","redirectStart")}}
      </td>
      <td>
        Khi chuyển hướng HTTP đầu tiên bắt đầu. Nếu không có chuyển hướng, hoặc
        nếu một trong các chuyển hướng không cùng nguồn gốc, giá trị trả về là
        <code>0</code>.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.redirectEnd","redirectEnd")}}
      </td>
      <td>
        <p>
          Khi chuyển hướng HTTP cuối cùng hoàn tất, tức là khi byte cuối cùng của
          phản hồi HTTP đã được nhận. Nếu không có chuyển hướng, hoặc nếu một
          trong các chuyển hướng không cùng nguồn gốc, giá trị trả về là
          <code>0</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.connectEnd","connectEnd")}}
      </td>
      <td>
        Khi kết nối được mở trên mạng. Nếu tầng truyền tải báo lỗi và quá trình
        thiết lập kết nối bắt đầu lại, thời điểm kết thúc thiết lập kết nối cuối
        cùng sẽ được trả về. Nếu dùng kết nối liên tục, giá trị sẽ giống
        <code>PerformanceTiming.fetchStart</code>. Một kết nối được xem là mở
        khi toàn bộ quá trình bắt tay kết nối an toàn hoặc xác thực SOCKS đã kết
        thúc.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.connectStart","connectStart")}}
      </td>
      <td>
        Khi yêu cầu mở kết nối được gửi tới mạng. Nếu tầng truyền tải báo lỗi
        và quá trình thiết lập kết nối bắt đầu lại, thời điểm bắt đầu thiết lập
        kết nối cuối cùng sẽ được trả về. Nếu dùng kết nối liên tục, giá trị sẽ
        giống <code>PerformanceTiming.fetchStart</code>.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.domainLookupEnd","domainLookupEnd")}}
      </td>
      <td>
        Khi tra cứu tên miền hoàn tất. Nếu dùng kết nối liên tục, hoặc thông
        tin được lưu trong bộ nhớ đệm hay tài nguyên cục bộ, giá trị sẽ giống
        <code>PerformanceTiming.fetchStart</code>.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.domainLookupStart","domainLookupStart")}}
      </td>
      <td>
        Khi tra cứu tên miền bắt đầu. Nếu dùng kết nối liên tục, hoặc thông tin
        được lưu trong bộ nhớ đệm hay tài nguyên cục bộ, giá trị sẽ giống
        <code>PerformanceTiming.fetchStart</code>.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.fetchStart","fetchStart")}}
      </td>
      <td>
        Khi trình duyệt đã sẵn sàng để lấy tài liệu bằng một yêu cầu HTTP. Thời
        điểm này xảy ra <em>trước</em> lần kiểm tra bất kỳ application cache nào.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.requestStart","requestStart")}}
      </td>
      <td>
        Khi trình duyệt gửi yêu cầu để lấy tài liệu thực tế, từ máy chủ hoặc từ
        bộ nhớ đệm. Nếu tầng truyền tải thất bại sau khi yêu cầu bắt đầu và kết
        nối được mở lại, thuộc tính này sẽ được đặt thành thời điểm tương ứng với
        yêu cầu mới.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.responseStart","responseStart")}}
      </td>
      <td>
        Khi trình duyệt nhận byte đầu tiên của phản hồi, từ máy chủ, từ bộ nhớ
        đệm hoặc từ tài nguyên cục bộ.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.responseEnd","responseEnd")}}
      </td>
      <td>
        Khi trình duyệt nhận byte cuối cùng của phản hồi, hoặc khi kết nối đóng
        nếu việc đó xảy ra trước, từ máy chủ, bộ nhớ đệm hoặc tài nguyên cục bộ.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.domLoading","domLoading")}}
      </td>
      <td>
        Khi trình phân tích cú pháp bắt đầu làm việc, tức là khi
        {{domxref('Document.readyState')}} của nó đổi thành
        <code>'loading'</code> và sự kiện
        {{DOMxRef("Document.readystatechange_event", "readystatechange")}}
        tương ứng được phát ra.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.unloadEventStart","unloadEventStart")}}
      </td>
      <td>
        Khi sự kiện {{DOMxRef("Window.unload_event", "unload")}} được phát ra,
        cho biết thời điểm tài liệu trước đó trong cửa sổ bắt đầu dỡ tải. Nếu
        không có tài liệu trước đó, hoặc nếu tài liệu trước đó hay một trong các
        chuyển hướng cần thiết không cùng nguồn gốc, giá trị trả về là
        <code>0</code>.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.unloadEventEnd","unloadEventEnd")}}
      </td>
      <td>
        Khi trình xử lý sự kiện
        <code><a href="/en-US/docs/Web/API/Window/unload_event">unload</a></code>
        kết thúc. Nếu không có tài liệu trước đó, hoặc nếu tài liệu trước đó
        hay một trong các chuyển hướng cần thiết không cùng nguồn gốc, giá trị
        trả về là <code>0</code>.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.domInteractive","domInteractive")}}
      </td>
      <td>
        Khi trình phân tích cú pháp hoàn tất công việc trên tài liệu chính, tức
        là khi <a href="/en-US/docs/Web/API/Document/readyState"
          ><code>Document.readyState</code></a
        >
        đổi thành <code>'interactive'</code> và sự kiện
        <code
          ><a href="/en-US/docs/Web/API/Document/readystatechange_event"
            >readystatechange</a
          ></code
        >
        tương ứng được phát ra.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.domContentLoadedEventStart","domContentLoadedEventStart")}}
      </td>
      <td>
        Ngay trước khi trình phân tích cú pháp phát sự kiện
        <code
          ><a href="/en-US/docs/Web/API/Document/DOMContentLoaded_event"
            >DOMContentLoaded</a
          ></code
        >, tức là ngay sau khi tất cả các script cần được thực thi ngay sau khi
        phân tích xong đã được thực thi.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.domContentLoadedEventEnd","domContentLoadedEventEnd")}}
      </td>
      <td>
        Ngay sau khi tất cả các script cần được thực thi càng sớm càng tốt, theo
        thứ tự hay không theo thứ tự, đã được thực thi xong.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.domComplete","domComplete")}}
      </td>
      <td>
        Khi trình phân tích cú pháp hoàn tất công việc trên tài liệu chính, tức
        là khi <a href="/en-US/docs/Web/API/Document/readyState"
          ><code>Document.readyState</code></a
        >
        đổi thành <code>'complete'</code> và sự kiện
        <code
          ><a href="/en-US/docs/Web/API/Document/readystatechange_event"
            >readystatechange</a
          ></code
        >
        tương ứng được phát ra.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.loadEventStart","loadEventStart")}}
      </td>
      <td>
        Khi sự kiện
        <code><a href="/en-US/docs/Web/API/Window/load_event">load</a></code>
        được gửi cho tài liệu hiện tại. Nếu sự kiện này chưa được gửi, nó trả về
        <code>0</code>.
      </td>
    </tr>
    <tr>
      <td>
        {{domxref("PerformanceTiming.loadEventEnd","loadEventEnd")}}
      </td>
      <td>
        Khi trình xử lý sự kiện
        <code><a href="/en-US/docs/Web/API/Window/load_event">load</a></code>
        kết thúc, tức là khi sự kiện load hoàn tất. Nếu sự kiện này chưa được
        gửi, hoặc chưa hoàn tất, nó trả về <code>0</code>.
      </td>
    </tr>
  </tbody>
</table>

### Tính toán thời gian

Chúng ta có thể dùng các giá trị này để đo những khoảng thời gian cụ thể:

```js
const dns = time.domainLookupEnd - time.domainLookupStart;
const tcp = time.connectEnd - time.connectStart;
const tls = time.requestStart - time.secureConnectionStart;
```

### Thời gian đến byte đầu tiên

[Time to First Byte](/en-US/docs/Glossary/Time_to_first_byte) là khoảng thời
gian giữa `navigationStart` (bắt đầu điều hướng) và `responseStart` (khi byte
đầu tiên của dữ liệu phản hồi được nhận) có sẵn trong API `performanceTiming`:

```js
const ttfb = time.responseStart - time.navigationStart;
```

### Thời gian tải trang

[Page load time](/en-US/docs/Glossary/Page_load_time) là khoảng thời gian giữa
`navigationStart` và thời điểm bắt đầu gửi sự kiện load cho tài liệu hiện tại.
Chúng chỉ có sẵn trong API performanceTiming.

```js
let pageloadTime = time.loadEventStart - time.navigationStart;
```

### Thời gian tra cứu DNS

Thời gian tra cứu DNS là khoảng thời gian giữa
[`domainLookupStart`](/en-US/docs/Web/API/PerformanceResourceTiming/domainLookupStart)
và [`domainLookupEnd`](/en-US/docs/Web/API/PerformanceResourceTiming/domainLookupEnd).
Cả hai đều có trong cả API `performanceTiming` và `performanceNavigationTiming`.

```js
const dns = time.domainLookupEnd - time.domainLookupStart;
```

### TCP

Thời gian bắt tay [TCP](/en-US/docs/Glossary/TCP) là khoảng thời gian giữa lúc
bắt đầu và kết thúc kết nối:

```js
const tcp = time.connectEnd - time.connectStart;
```

### Thương lượng TLS

[`secureConnectionStart`](/en-US/docs/Web/API/PerformanceResourceTiming/secureConnectionStart)
sẽ là `undefined` nếu không khả dụng, `0` nếu không dùng [HTTPS](/en-US/docs/Glossary/HTTPS),
hoặc là một dấu thời gian nếu khả dụng và được dùng. Nói cách khác, nếu một
kết nối an toàn được dùng thì `secureConnectionStart` sẽ là [truthy](/en-US/docs/Glossary/Truthy),
và thời gian giữa `secureConnectionStart` và `requestStart` sẽ lớn hơn 0.

```js
const tls = time.requestStart - time.secureConnectionStart;
```

## API mục nhập hiệu năng

Các mốc thời gian hiệu năng tổng quát ở trên đã bị loại bỏ nhưng vẫn được hỗ
trợ đầy đủ. Hiện giờ chúng ta có [API mục nhập hiệu năng](/en-US/docs/Web/API/PerformanceEntry),
API này cung cấp khả năng đánh dấu và đo thời gian dọc theo quá trình điều
hướng và tải tài nguyên. Bạn cũng có thể tạo các dấu:

```js
performance.getEntriesByType("navigation").forEach((navigation) => {
  console.dir(navigation);
});

performance.getEntriesByType("resource").forEach((resource) => {
  console.dir(resource);
});

performance.getEntriesByType("mark").forEach((mark) => {
  console.dir(mark);
});

performance.getEntriesByType("measure").forEach((measure) => {
  console.dir(measure);
});

performance.getEntriesByType("paint").forEach((paint) => {
  console.dir(paint);
});

performance.getEntriesByType("frame").forEach((frame) => {
  console.dir(frame);
});
```

Trong các trình duyệt hỗ trợ, bạn có thể dùng
`performance.getEntriesByType('paint')` để truy vấn phép đo cho `first-paint`
và `first-contentful-paint`. Chúng ta dùng
`performance.getEntriesByType('navigation')` và
`performance.getEntriesByType('resource')` để truy vấn lần lượt navigation timings
và resource timings.

## Định thời điều hướng

Khi người dùng yêu cầu một website hoặc ứng dụng, [để đổ nội dung vào trình duyệt](/en-US/docs/Web/Performance/Guides/How_browsers_work)
user agent đi qua một chuỗi bước, bao gồm tra cứu {{glossary('DNS')}}, {{glossary('TCP handshake')}}
và thương lượng TLS, trước khi user agent thực hiện yêu cầu thực sự và các
máy chủ trả về tài sản được yêu cầu. Sau đó, trình duyệt phân tích nội dung
nhận được, xây dựng DOM, CSSOM, accessibility tree và render tree, cuối cùng
hiển thị trang. Khi user agent ngừng phân tích tài liệu, nó đặt trạng thái sẵn
sàng của tài liệu thành _interactive_. Nếu có các script trì hoãn cần được
phân tích, nó sẽ làm vậy, rồi phát [DOMContentLoaded](/en-US/docs/Web/API/Document/DOMContentLoaded_event),
sau đó trạng thái sẵn sàng được đặt thành _complete_. Lúc này Document có thể
xử lý các tác vụ sau tải, và sau đó tài liệu được đánh dấu là đã tải hoàn toàn.

```js
const navigationTimings = performance.getEntriesByType("navigation");
```

`performance.getEntriesByType('navigation')` trả về một mảng các đối tượng
[PerformanceEntry](/en-US/docs/Web/API/PerformanceEntry) cho _navigation_ _type_.

![Kết quả khi nhập performance.getEntriesByType('navigation'); trong console cho tài liệu này](perfgentrybytypenavigation.png)

Có thể rút ra rất nhiều từ các mốc thời gian này. Trong hình trên, thông qua
thuộc tính _name_ ta thấy tệp đang được đo là chính tài liệu này. Ở phần còn
lại của giải thích, chúng ta dùng biến sau:

```js
const timing = performance.getEntriesByType("navigation")[0];
```

### Giao thức

Chúng ta có thể kiểm tra giao thức được dùng bằng cách truy vấn:

```js
const protocol = timing.nextHopProtocol;
```

Nó trả về giao thức mạng được dùng để lấy tài nguyên: trong trường hợp này là
`h2` cho `http/2`.

### Nén

Để lấy phần trăm tiết kiệm từ nén, chúng ta chia `transferSize` cho
`decodedBodySize`, rồi lấy 100% trừ đi kết quả đó. Ta thấy mức tiết kiệm hơn
74%.

```js
const compressionSavings = 1 - timing.transferSize / timing.decodedBodySize;
```

Ta cũng có thể dùng

```js
const compressionSavings = 1 - timing.encodedBodySize / timing.decodedBodySize;
```

nhưng dùng `transferSize` sẽ bao gồm các byte overhead.

Để so sánh, chúng ta có thể xem tab mạng và thấy rằng đã truyền 22.04KB cho
một tệp chưa nén có kích thước 87.24KB.

![Chế độ xem số byte đã truyền và kích thước qua tab mạng](bytesdownloaded.png)

Nếu tính toán với các con số này, ta được kết quả giống nhau:
`1 - (22.04 / 87.24) = 0.747`. Định thời điều hướng cho chúng ta một cách để
kiểm tra tự động kích thước truyền và phần tiết kiệm băng thông.

Lưu ý đây chỉ là kích thước của riêng tài liệu này: chỉ cho tài nguyên này, chứ
không phải cho toàn bộ các tài nguyên cộng lại. Tuy nhiên, thời lượng, sự kiện
tải và các mốc liên quan đến DOM là về toàn bộ điều hướng, không phải chỉ riêng
tài sản này. Các ứng dụng web phía client có thể trông nhanh hơn trang này với
kích thước truyền dưới 10000 và decoded body size dưới 30000, nhưng điều đó
không có nghĩa là JavaScript, CSS hoặc media không làm tăng kích thước không
cần thiết. Việc kiểm tra tỷ lệ nén là quan trọng nhưng cũng cần kiểm tra thời
lượng và khoảng thời gian giữa lúc sự kiện DOMContentLoaded kết thúc và khi DOM
hoàn tất, vì việc chạy JavaScript trên main thread trong thời gian dài có thể
dẫn đến giao diện người dùng không phản hồi.

### Thời gian yêu cầu

API không cung cấp mọi phép đo mà bạn có thể muốn. Ví dụ, yêu cầu mất bao lâu?
Chúng ta có thể dùng các phép đo sẵn có để tìm câu trả lời.

Để đo thời gian phản hồi, trừ thời điểm bắt đầu yêu cầu khỏi thời điểm bắt đầu
phản hồi. Request start là khoảnh khắc ngay trước khi user agent bắt đầu yêu
cầu tài nguyên từ máy chủ, từ các application cache phù hợp hoặc từ tài nguyên
cục bộ. Response start là thời điểm ngay sau khi bộ phân tích HTTP của user
agent nhận byte đầu tiên của phản hồi từ các application cache phù hợp, từ
tài nguyên cục bộ hoặc từ máy chủ, xảy ra sau khi yêu cầu được nhận và xử lý.

```js
const request = timing.responseStart - timing.requestStart;
```

### Thời lượng sự kiện tải

Bằng cách lấy dấu thời gian ngay trước khi sự kiện load của tài liệu hiện tại
được phát và trừ đi thời điểm sự kiện load của tài liệu hiện tại hoàn tất, bạn
có thể đo thời lượng của sự kiện load.

```js
const load = timing.loadEventEnd - timing.loadEventStart;
```

### Sự kiện DOMContentLoaded

Thời lượng sự kiện DOMContentLoaded được đo bằng cách trừ giá trị thời gian
ngay trước khi user agent phát sự kiện DOMContentLoaded khỏi giá trị thời gian
ngay sau khi sự kiện kết thúc. Giữ mức này ở 50ms hoặc thấp hơn giúp bảo đảm
giao diện người dùng phản hồi tốt.

```js
const DOMContentLoaded =
  timing.domContentLoadedEventEnd - timing.domContentLoadedEventStart;
```

### Thời lượng

Chúng ta được cung cấp giá trị thời lượng. Thời lượng là hiệu giữa thuộc tính
[PerformanceNavigationTiming.loadEventEnd](/en-US/docs/Web/API/PerformanceNavigationTiming/loadEventEnd)
và [PerformanceEntry.startTime](/en-US/docs/Web/API/PerformanceEntry/startTime).

Giao diện PerformanceNavigationTiming cũng cung cấp thông tin về loại điều hướng
bạn đang đo, trả về `navigate`, `reload` hoặc `back_forward`.

## Định thời tài nguyên

Trong khi navigation timing dùng để đo hiệu năng của _trang chính_, thường là
tệp HTML mà từ đó mọi tài sản khác được yêu cầu, resource timing đo thời gian
cho _các tài nguyên riêng lẻ_, tức các tài sản được trang chính gọi tới và mọi
tài sản mà các tài nguyên đó yêu cầu. Nhiều phép đo tương tự nhau: có tra cứu
DNS, bắt tay TCP và bắt đầu kết nối an toàn, mỗi thứ diễn ra một lần cho mỗi
miền.

![Đồ họa các dấu thời gian Resource Timing](resourcetiming-timestamps.jpg)

Điều chính cần xem xét cho từng tài nguyên.

## Xem thêm

- {{domxref("PerformanceNavigationTiming")}}
- {{domxref("PerformanceResourceTiming")}},
- {{domxref("PerformanceMark")}}
- {{domxref("PerformanceMeasure")}}
- {{domxref("PerformancePaintTiming")}}
