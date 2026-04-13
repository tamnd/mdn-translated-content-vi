---
title: Đăng ký attribution source
slug: Web/API/Attribution_Reporting_API/Registering_sources
page-type: guide
status:
  - deprecated
---

{{DefaultAPISidebar("Attribution Reporting API")}}{{deprecated_header}}

Bài viết này giải thích cách đăng ký attribution source khi sử dụng [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API).

## Phương pháp cơ bản

Attribution source có dạng là các liên kết, hình ảnh hoặc script nằm trong nội dung mà bạn muốn đo lường tương tác (ví dụ, đó có thể là các quảng cáo mà bạn muốn đo lượt chuyển đổi). Chúng khiến trình duyệt lưu dữ liệu source trong một bộ nhớ đệm cục bộ riêng tư (chỉ trình duyệt mới truy cập được) khi các tương tác người dùng cụ thể diễn ra. Các loại attribution source khác nhau được đăng ký và phát tín hiệu tương tác theo những cách khác nhau, được phân biệt như sau:

- Navigation source, khiến trình duyệt lưu dữ liệu source để phản hồi với việc điều hướng, ví dụ khi người dùng nhấp vào liên kết hoặc kích hoạt nó bằng bàn phím, hoặc khi một lần điều hướng xảy ra do lời gọi {{domxref("Window.open()")}}. Xem [Attribution source dựa trên điều hướng](#attribution-source-dựa-trên-điều-hướng) để biết ví dụ.
- Event source, khiến trình duyệt lưu dữ liệu source để phản hồi khi các sự kiện được kích hoạt. Xem [Attribution source dựa trên sự kiện](#attribution-source-dựa-trên-sự-kiện) để biết ví dụ.

Những gì xảy ra ở hậu trường để đăng ký source và truy xuất rồi lưu dữ liệu source là giống nhau trong cả hai trường hợp:

1. Khi người dùng tương tác với attribution source, nó gửi header {{httpheader("Attribution-Reporting-Eligible")}} trong một yêu cầu tới máy chủ đo lường các tương tác (thường là máy chủ của nhà quảng cáo), nhằm chỉ ra rằng phản hồi đủ điều kiện để đăng ký source. Ví dụ:

   ```http
   Attribution-Reporting-Eligible: navigation-source
   ```

2. Khi máy chủ nhận được một yêu cầu có chứa header `Attribution-Reporting-Eligible`, nó có thể kèm theo header {{httpheader("Attribution-Reporting-Register-Source")}} trong phản hồi để hoàn tất việc đăng ký source. Giá trị của nó là một chuỗi JSON cung cấp thông tin mà trình duyệt nên lưu về attribution source đã được tương tác. Thông tin bao gồm trong header này cũng xác định loại báo cáo mà trình duyệt sẽ tạo:
   - Ví dụ sau sẽ làm tạo ra một [báo cáo cấp sự kiện](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#event-level_reports) khi một [trigger](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers) được đối sánh với source:

     ```js
     res.set(
       "Attribution-Reporting-Register-Source",
       JSON.stringify({
         source_event_id: "412444888111012",
         destination: "https://advertiser.example",
         trigger_data: [0, 1, 2, 3, 4],
         trigger_data_matching: "exact",
         expiry: "604800",
         priority: "100",
         debug_key: "122939999",
         event_report_window: "86400",
       }),
     );
     ```

     Trường bắt buộc duy nhất trong ngữ cảnh này là `destination`, chỉ định từ 1-3 trang mà trên đó trigger được kỳ vọng sẽ xảy ra. Chúng được dùng để đối sánh attribution trigger với source khi một trigger được tương tác. Các trường khác được chỉ định ở trên có tác dụng như sau:
     - `"source_event_id"`: Một chuỗi biểu diễn ID cho attribution source; ID này có thể được dùng để ánh xạ nó với thông tin khác khi attribution source được tương tác, hoặc để tổng hợp thông tin tại endpoint báo cáo (xem [Tạo báo cáo > Quy trình cơ bản](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#basic_process) để biết thông tin endpoint).
     - `"trigger_data"`: Một mảng số nguyên không dấu 32 bit biểu diễn dữ liệu mô tả các sự kiện trigger khác nhau có thể khớp với source này. Ví dụ, "người dùng thêm mặt hàng vào giỏ" hoặc "người dùng đăng ký danh sách thư" có thể là những hành động xảy ra tại trang trigger và có thể khớp với source này, qua đó chỉ ra một dạng chuyển đổi mà nhà quảng cáo đang muốn đo. Chúng phải được đối sánh với `"trigger_data"` được chỉ định trong [trigger](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Trigger#trigger_data) để việc attribution cấp sự kiện có thể diễn ra.
       > [!NOTE]
       > Các giá trị được dùng để biểu diễn từng sự kiện, cũng như số phần tử trong mảng, là hoàn toàn tùy ý và do bạn với tư cách là nhà phát triển định nghĩa. Mảng có thể chứa các giá trị không được dùng, nhưng các giá trị phải hiện diện trong mảng để được trình duyệt gán cho source khi trigger được đăng ký.
     - `"trigger_data_matching"`: Một chuỗi chỉ định cách `"trigger_data"` từ trigger được đối sánh với `"trigger_data"` của source. `"exact"` là giá trị mà bạn gần như luôn sẽ dùng, nghĩa là đối sánh theo giá trị chính xác.
     - `"expiry"`: Một chuỗi biểu diễn thời gian hết hạn tính bằng giây cho attribution source; sau thời điểm đó source sẽ không còn hoạt động (tức các trigger tiếp theo sẽ không thể được gán cho source này).
     - `"priority"`: Một chuỗi biểu diễn giá trị ưu tiên cho attribution source. Xem [Mức ưu tiên và giới hạn của báo cáo](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#report_priorities_and_limits) để biết thêm thông tin.
     - `"debug_key"`: Một số nguyên không dấu 64 bit được định dạng cơ số 10, biểu diễn một khóa gỡ lỗi. Hãy đặt trường này nếu bạn muốn tạo một [báo cáo gỡ lỗi](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#debug_reports) cùng với báo cáo attribution liên quan.
     - `"event_report_window"`: Một chuỗi biểu diễn thời gian tính bằng giây, sau đó các trigger tiếp theo sẽ không còn có thể được gán cho source này nhằm tạo báo cáo cấp sự kiện.

     Xem {{httpheader("Attribution-Reporting-Register-Source")}} để có mô tả chi tiết về tất cả các trường khả dụng trên header này.

   - Để trình duyệt tạo một [báo cáo tóm tắt](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#summary_reports) khi một trigger được đối sánh với source, bạn cần thêm một số trường bổ sung, _ngoài ra_ vẫn cần các trường bắt buộc để tạo báo cáo cấp sự kiện.

     ```js
     res.set(
       "Attribution-Reporting-Register-Source",
       JSON.stringify({
         source_event_id: "412444888111012",
         destination: "https://advertiser.example",
         trigger_data: [0, 1, 2, 3, 4],
         trigger_data_matching: "exact",
         expiry: "604800",
         priority: "100",
         debug_key: "122939999",
         event_report_window: "86400",

         aggregation_keys: {
           campaignCounts: "0x159",
           geoValue: "0x5",
         },
         aggregatable_report_window: "86400",
       }),
     );
     ```

     Các trường bổ sung trong ví dụ này là:
     - `"aggregation_keys"`: Một đối tượng chứa các khóa do người dùng cung cấp, đại diện cho những điểm dữ liệu khác nhau mà giá trị báo cáo sẽ được tổng hợp theo đó.
     - `"aggregatable_report_window"`: Một chuỗi biểu diễn khoảng thời gian tính bằng giây, sau đó dữ liệu trigger sẽ không còn được đưa vào các báo cáo có thể tổng hợp được tạo ra.

     Một lần nữa, hãy xem {{httpheader("Attribution-Reporting-Register-Source")}} để biết mô tả chi tiết về mọi trường khả dụng trên header này.

3. Sau khi việc đăng ký source thành công, trình duyệt lưu dữ liệu source đã cung cấp trong bộ nhớ đệm cục bộ riêng tư của nó.

## Attribution source dựa trên điều hướng

Navigation source hữu ích để đo lường tương tác với các liên kết. Ví dụ, người dùng có thể nhìn thấy một quảng cáo trên trang của nhà xuất bản và nhấp vào đó để điều hướng tới trang của nhà quảng cáo, nơi hy vọng sẽ xảy ra chuyển đổi.

Có một vài kiểu attribution source dựa trên điều hướng khác nhau có thể được đăng ký (ví dụ nhấp vào quảng cáo), gồm những kiểu dựa trên HTML (dùng thuộc tính `attributionsrc`) và những kiểu dựa trên lời gọi {{domxref("Window.open()")}} (dùng một window feature `attributionsrc`).

### Navigation source dựa trên HTML

Để đăng ký một attribution source dựa trên điều hướng, bạn có thể thêm thuộc tính `attributionsrc` vào phần tử {{htmlelement("a")}} phù hợp; thuộc tính này chỉ định nơi mà yêu cầu đăng ký sẽ được gửi tới.

Nếu bạn để giá trị thuộc tính trống, yêu cầu đăng ký sẽ được gửi tới vị trí mà liên kết đang trỏ tới. Cũng có thể chỉ định một hoặc nhiều URL bổ sung trong giá trị để gửi yêu cầu đăng ký tới; xem [Chỉ định URL bên trong attributionsrc](#chỉ-định-url-bên-trong-attributionsrc) để biết thêm chi tiết.

`attributionsrc` có thể được thêm theo cách khai báo:

```html
<a href="https://shop.example" attributionsrc target="_blank">
  Nhấp để truy cập cửa hàng của chúng tôi
</a>
```

Hoặc thông qua thuộc tính {{domxref("HTMLAnchorElement.attributionSrc")}}:

```js
const aElem = document.querySelector("a");
aElem.attributionSrc = "";
```

Trong trường hợp này, tương tác xảy ra, khiến trình duyệt lưu dữ liệu source liên quan đến attribution source dựa trên điều hướng (như được cung cấp trong header phản hồi {{httpheader("Attribution-Reporting-Register-Source")}}) khi người dùng nhấp vào liên kết và trình duyệt nhận được phản hồi.

### Navigation source dựa trên Window.open()

Bạn cũng có thể thêm từ khóa tính năng `attributionsrc` vào thuộc tính features của lời gọi {{domxref("Window.open()")}}. Trong ví dụ này, chúng ta gọi nó để phản hồi khi sự kiện `click` được kích hoạt:

```js
elem.addEventListener("click", () => {
  window.open("https://shop.example", "_blank", "attributionsrc");
});
```

Trong trường hợp này, tương tác xảy ra và trình duyệt lưu dữ liệu source khi `Window.open()` được gọi, đồng thời trình duyệt nhận được phản hồi.

> [!NOTE]
> Khi thiết lập một sự kiện [`click`](/en-US/docs/Web/API/Element/click_event) như trong ví dụ trên, nên gắn nó lên một điều khiển mà việc nhấp là điều được mong đợi, chẳng hạn phần tử {{htmlelement("button")}} hoặc {{htmlelement("a")}}. Cách này hợp lý hơn về mặt ngữ nghĩa, đồng thời cũng dễ tiếp cận hơn với cả người dùng trình đọc màn hình lẫn người dùng bàn phím.

> [!NOTE]
> Để đăng ký attribution source qua `open()`, lời gọi này phải được thực hiện với [transient activation](/en-US/docs/Glossary/Transient_activation) (tức bên trong trình xử lý sự kiện tương tác người dùng như `click`) trong vòng năm giây kể từ lúc người dùng tương tác.

## Attribution source dựa trên sự kiện

Attribution source dựa trên sự kiện khiến trình duyệt lưu dữ liệu source để phản hồi với việc một loại sự kiện nào đó được kích hoạt, chẳng hạn sự kiện `load` trong trường hợp phần tử `<img>` hoặc `<script>` (cả hai đều dùng thuộc tính `attributionsrc` giống như ta đã thấy với phần tử `<a>` ở trên), hoặc một sự kiện tùy chỉnh do bạn chọn đặt trong JavaScript.

### Event source dựa trên HTML

Event source dựa trên HTML có thể được dùng để đo lường tương tác với trang của nhà xuất bản khi trang tải lần đầu, hoặc chính xác hơn là khi một phần tử `<img>` hoặc `<script>` tải xong. Để đăng ký attribution source dựa trên sự kiện qua HTML, bạn có thể thêm thuộc tính `attributionsrc` vào một phần tử phù hợp, như {{htmlelement("img")}} hoặc {{htmlelement("script")}}.

Nếu bạn để giá trị thuộc tính trống, yêu cầu đăng ký sẽ được gửi tới máy chủ lưu trữ tài nguyên được yêu cầu. Cũng có thể chỉ định một hoặc nhiều URL bổ sung trong giá trị để gửi yêu cầu đăng ký tới; xem [Chỉ định URL bên trong attributionsrc](#chỉ-định-url-bên-trong-attributionsrc) để biết thêm chi tiết.

Hãy xem ví dụ về phần tử `<img>`:

```html
<img src="advertising-image.png" alt="" attributionsrc />
```

Bạn cũng có thể thực hiện điều này qua thuộc tính {{domxref("HTMLImageElement.attributionSrc")}}:

```js
const imgElem = document.querySelector("img");
imgElem.attributionSrc = "";
```

Trình duyệt lưu dữ liệu attribution source khi nó nhận được phản hồi chứa tệp hình ảnh (tức là khi sự kiện `load` xảy ra). Hãy lưu ý rằng người dùng không nhất thiết có thể nhìn thấy hình ảnh này; đó có thể chỉ là một pixel theo dõi trong suốt 1x1 chỉ được dùng cho attribution reporting.

Ví dụ về phần tử {{htmlelement("script")}} có thể trông như sau:

```html
<script src="advertising-script.js" attributionsrc></script>
```

Hoặc thông qua thuộc tính {{domxref("HTMLScriptElement.attributionSrc")}}:

```js
const scriptElem = document.querySelector("script");
scriptElem.attributionSrc = "";
```

Trong trường hợp này, tương tác xảy ra và trình duyệt lưu dữ liệu source khi nó nhận được phản hồi chứa script.

### Event source dựa trên JavaScript

Attribution source dựa trên script linh hoạt hơn attribution source dựa trên HTML. Bạn có thể thiết lập một script để khởi tạo một yêu cầu đủ điều kiện đăng ký attribution source dựa trên bất kỳ yêu cầu nào phù hợp với ứng dụng của bạn. Đây là một cách tiếp cận linh hoạt, hữu ích khi bạn muốn lưu dữ liệu source để phản hồi với các tương tác tùy chỉnh, ví dụ nhấp vào một phần tử tùy biến hoặc gửi biểu mẫu.

Để thiết lập attribution source dựa trên script, bạn có thể:

- Gửi một yêu cầu {{domxref("Window/fetch", "fetch()")}} có chứa tùy chọn `attributionReporting`:

  ```js
  const attributionReporting = {
    eventSourceEligible: true,
    triggerEligible: false,
  };

  // Tùy chọn đặt keepalive để bảo đảm yêu cầu vẫn tồn tại sau khi rời trang
  function triggerSourceInteraction() {
    fetch("https://shop.example/endpoint", {
      keepalive: true,
      attributionReporting,
    });
  }

  // Liên kết việc kích hoạt tương tác với bất kỳ
  // sự kiện nào phù hợp với mã của bạn (không nhất thiết phải là
  // sự kiện DOM/tương tác người dùng)
  elem.addEventListener("click", triggerSourceInteraction);
  ```

- Gửi một {{domxref("XMLHttpRequest")}} với lời gọi {{domxref("XMLHttpRequest.setAttributionReporting", "setAttributionReporting()")}} trên đối tượng yêu cầu:

  ```js
  const attributionReporting = {
    eventSourceEligible: true,
    triggerEligible: false,
  };

  function triggerSourceInteraction() {
    const req = new XMLHttpRequest();
    req.open("GET", "https://shop.example/endpoint");
    // Kiểm tra khả năng sẵn có của setAttributionReporting() trước khi gọi
    if (typeof req.setAttributionReporting === "function") {
      req.setAttributionReporting(attributionReporting);
      req.send();
    } else {
      throw new Error("Attribution reporting not available");
      // Thêm mã khôi phục tại đây nếu phù hợp
    }
  }

  // Liên kết việc kích hoạt tương tác với bất kỳ
  // sự kiện nào phù hợp với mã của bạn (không nhất thiết phải là
  // sự kiện DOM/tương tác người dùng)
  elem.addEventListener("click", triggerSourceInteraction);
  ```

Trong trường hợp này, tương tác xảy ra và trình duyệt lưu dữ liệu source khi nó nhận được phản hồi từ yêu cầu fetch.

> [!NOTE]
> Yêu cầu có thể hướng tới bất kỳ tài nguyên nào. Nó không nhất thiết phải liên quan trực tiếp tới Attribution Reporting API, và có thể là yêu cầu lấy JSON, văn bản thuần, blob hình ảnh hoặc bất cứ nội dung nào khác phù hợp với ứng dụng của bạn.

## Chỉ định URL bên trong attributionsrc

Cho đến nay, trong mọi ví dụ mà chúng ta đã thấy, thuộc tính/tính năng `attributionsrc` hoặc thuộc tính `attributionSrc` đều được để trống, nhận giá trị chuỗi rỗng. Điều này ổn nếu máy chủ giữ tài nguyên được yêu cầu cũng chính là máy chủ mà bạn muốn xử lý việc đăng ký, tức là nhận header {{httpheader("Attribution-Reporting-Eligible")}} và phản hồi bằng header {{httpheader("Attribution-Reporting-Register-Source")}}.

Tuy nhiên, có thể tài nguyên được yêu cầu không nằm trên máy chủ mà bạn kiểm soát, hoặc bạn đơn giản chỉ muốn xử lý việc đăng ký attribution source trên một máy chủ khác. Trong những trường hợp như vậy, bạn có thể chỉ định một hoặc nhiều URL làm giá trị của `attributionsrc`. Khi yêu cầu tài nguyên diễn ra, header {{httpheader("Attribution-Reporting-Eligible")}} sẽ được gửi tới các URL được chỉ định trong `attributionsrc` ngoài origin của tài nguyên; các URL này sau đó có thể phản hồi bằng {{httpheader("Attribution-Reporting-Register-Source")}} để đăng ký source.

Ví dụ, trong trường hợp phần tử `<a>`, bạn có thể khai báo URL trong thuộc tính `attributionsrc`:

```html
<a
  href="https://shop.example"
  attributionsrc="https://a.example/register-source">
  Nhấp để truy cập cửa hàng của chúng tôi
</a>
```

Hoặc trong JavaScript qua thuộc tính `attributionSrc`:

```js
// encode các URL phòng trường hợp chúng chứa ký tự đặc biệt
// chẳng hạn '=' có thể bị phân tích cú pháp sai.
const encodedUrlA = encodeURIComponent("https://a.example/register-source");
const encodedUrlB = encodeURIComponent("https://b.example/register-source");

const aElem = document.querySelector("a");
aElem.attributionSrc = `${encodedUrlA} ${encodedUrlB}`;
```

Trong trường hợp lời gọi {{domxref("Window.open()")}}, các URL khác nhau sẽ phải được liệt kê thành nhiều tính năng `attributionsrc` tách biệt trong tham số [`windowFeatures`](/en-US/docs/Web/API/Window/open#windowfeatures), được phân tách bằng dấu phẩy hoặc khoảng trắng:

```js
// encode các URL phòng trường hợp chúng chứa ký tự đặc biệt
// chẳng hạn '=' có thể bị phân tích cú pháp sai.
const encodedUrlA = encodeURIComponent("https://a.example/register-source");
const encodedUrlB = encodeURIComponent("https://b.example/register-source");

elem.addEventListener("click", () => {
  window.open(
    "https://ourshop.example",
    "_blank",
    `attributionsrc=${encodedUrlA},attributionsrc=${encodedUrlB}`,
  );
});
```

> [!NOTE]
> Việc chỉ định nhiều URL có nghĩa là nhiều attribution source có thể được đăng ký trên cùng một tính năng. Ví dụ, bạn có thể có nhiều chiến dịch khác nhau mà bạn đang muốn đo mức độ thành công, và những chiến dịch đó tạo ra các báo cáo khác nhau trên các bộ dữ liệu khác nhau.

## Xem thêm

- [Công cụ kiểm tra Attribution Reporting Header](https://wicg.github.io/attribution-reporting-api/validate-headers)
