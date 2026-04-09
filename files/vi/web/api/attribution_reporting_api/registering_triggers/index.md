---
title: Đăng ký attribution trigger
slug: Web/API/Attribution_Reporting_API/Registering_triggers
page-type: guide
status:
  - deprecated
---

{{DefaultAPISidebar("Attribution Reporting API")}}{{deprecated_header}}

Bài viết này giải thích cách đăng ký attribution trigger.

## Phương pháp cơ bản

Sau khi bạn đã [đăng ký attribution source](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources), bạn cần đăng ký attribution trigger. Đây là những tương tác trên một trang nơi cần đo lường lượt chuyển đổi (ví dụ, nhấp vào nút "purchase" trên trang của nhà quảng cáo có thể chỉ ra rằng một lượt chuyển đổi đã xảy ra). Trình duyệt sau đó sẽ cố gắng đối sánh attribution trigger với một mục attribution source được lưu trong một vùng lưu trữ cục bộ riêng tư, và [tạo một báo cáo](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports) nếu tìm thấy đối sánh.

Các loại attribution trigger khác nhau được đăng ký theo những cách khác nhau; các cách này được mô tả chi tiết trong các phần bên dưới. Xem [Attribution trigger dựa trên HTML](#attribution-trigger-dựa-trên-html) và [Attribution trigger dựa trên JavaScript](#attribution-trigger-dựa-trên-javascript).

Tuy nhiên, những gì xảy ra ở hậu trường để đăng ký trigger, tìm đối sánh, v.v. là giống nhau trong mọi trường hợp.

1. Tất cả các loại trigger đều gửi header {{httpheader("Attribution-Reporting-Eligible")}} trong một yêu cầu, chỉ ra rằng phản hồi đủ điều kiện để đăng ký trigger. Ví dụ:

   ```http
   Attribution-Reporting-Eligible: trigger
   ```

2. Khi máy chủ nhận được một yêu cầu có chứa header `Attribution-Reporting-Eligible`, nó có thể kèm một header {{httpheader("Attribution-Reporting-Register-Trigger")}} trong phản hồi. Giá trị của header này là một chuỗi JSON chứa dữ liệu có thể được đưa vào các báo cáo được tạo ra, chẳng hạn ID của trigger, cùng các giá trị ưu tiên và loại bỏ trùng lặp.

   Ví dụ sau được thiết kế để khớp với một attribution source [báo cáo cấp sự kiện](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#event-level_reports):

   ```js
   res.set(
     "Attribution-Reporting-Register-Trigger",
     JSON.stringify({
       event_trigger_data: [
         {
           trigger_data: "4",
           priority: "1000000000000",
           deduplication_key: "2345698765",
         },
       ],
       debug_key: "1115698977",
     }),
   );
   ```

   Các trường được chỉ định ở đây như sau:
   - `"event_trigger_data"`: Một đối tượng biểu diễn dữ liệu về trigger. Đối tượng này bao gồm:
     - `"trigger_data"`: Dữ liệu liên kết với trigger, thường được dùng để biểu thị các sự kiện như "người dùng thêm mặt hàng vào giỏ" hoặc "người dùng đăng ký danh sách thư". Giá trị này sẽ được đưa vào báo cáo được tạo ra, nếu có, mặc dù nó sẽ chịu sự điều chỉnh dựa trên trường [`"trigger_data_matching"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#trigger_data_matching) của source được gán.
       > [!NOTE]
       > Các giá trị được dùng để biểu diễn từng sự kiện, cũng như số phần tử trong mảng, là hoàn toàn tùy ý và do bạn với tư cách là nhà phát triển định nghĩa. Mảng có thể chứa các giá trị không được dùng, nhưng các giá trị phải hiện diện trong mảng để được trình duyệt gán cho source khi trigger được đăng ký.
     - `"priority"`: Một chuỗi biểu diễn giá trị ưu tiên cho attribution trigger. Xem [Mức ưu tiên và giới hạn của báo cáo](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#report_priorities_and_limits) để biết thêm thông tin.
     - `"deduplication_key"`: Một chuỗi biểu diễn khóa duy nhất có thể dùng để ngăn attribution bị lặp lại, ví dụ nếu người dùng thêm cùng một mặt hàng vào giỏ nhiều lần. Xem [Prevent duplication in reports](https://privacysandbox.google.com/private-advertising/attribution-reporting/prevent-duplication) để biết thêm thông tin.
   - `"debug_key"`: Một số biểu diễn khóa gỡ lỗi. Hãy đặt trường này nếu bạn muốn tạo một [báo cáo gỡ lỗi](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#debug_reports) cùng với báo cáo attribution liên quan.

   Xem {{httpheader("Attribution-Reporting-Register-Trigger")}} để có mô tả chi tiết về mọi trường khả dụng.

   Một trigger được thiết kế để khớp với attribution source [báo cáo tóm tắt](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#summary_reports) cần các trường được hiển thị dưới đây:

   ```js
   res.set(
     "Attribution-Reporting-Register-Trigger",
     JSON.stringify({
       aggregatable_trigger_data: [
         {
           key_piece: "0x400",
           source_keys: ["campaignCounts"],
         },
         {
           key_piece: "0xA80",
           source_keys: ["geoValue", "nonMatchingKeyIdsAreIgnored"],
         },
       ],
       aggregatable_values: {
         campaignCounts: 32768,
         geoValue: 1664,
       },
       debug_key: "1115698977",
     }),
   );
   ```

   Các trường trong ví dụ này là:
   - `"aggregatable_trigger_data"`: Một mảng các đối tượng, mỗi đối tượng định nghĩa một khóa tổng hợp để áp dụng cho các source key khác nhau.
   - `"aggregatable_values"`: Một đối tượng chứa các thuộc tính biểu diễn giá trị cho từng điểm dữ liệu được định nghĩa trong `"aggregatable_trigger_data"`.

   Một lần nữa, hãy xem {{httpheader("Attribution-Reporting-Register-Trigger")}} để có mô tả chi tiết về mọi trường khả dụng.

3. Khi người dùng tương tác với attribution trigger, trình duyệt cố gắng đối sánh trigger đó với bất kỳ mục attribution source nào được lưu trong bộ nhớ đệm cục bộ riêng tư của trình duyệt. Để đối sánh thành công, [`"trigger_data"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Trigger#trigger_data) của `Attribution-Reporting-Register-Trigger` phải khớp với một trong các giá trị được cung cấp trong [`"trigger_data"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#trigger_data) của {{httpheader("Attribution-Reporting-Register-Source")}}, và trang (scheme + {{glossary("registrable domain")}}) của trang cấp cao nhất nơi trigger đang được đăng ký phải:
   - khớp với trang của ít nhất một trong các `destination` được chỉ định trong dữ liệu liên quan của source.
   - cùng origin với yêu cầu đã chỉ định việc đăng ký source.

   > [!NOTE]
   > Các yêu cầu này cung cấp khả năng bảo vệ quyền riêng tư, nhưng cũng mang lại sự linh hoạt. Source _và_ trigger đều có thể được nhúng trong một {{htmlelement("iframe")}} hoặc nằm trên trang cấp cao nhất.

   Có nhiều yếu tố khác cũng sẽ ngăn việc đối sánh thành công; ví dụ:
   - Bộ lọc của trigger không khớp với filter data của source (xem [Bộ lọc](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#filters) để biết thêm chi tiết).
   - Thiết lập [`"trigger_data_matching"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#trigger_data_matching) của source khiến không có đối sánh nào xảy ra.
   - Đã đạt tới giới hạn [`"max_event_level_reports"`](/en-US/docs/Web/HTTP/Reference/Headers/Attribution-Reporting-Register-Source#max_event_level_reports) của source.
   - Một đối sánh thành công không được báo cáo do thuật toán randomized response của trình duyệt. Xem [Thêm nhiễu vào báo cáo](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports#adding_noise_to_reports) để biết thêm chi tiết.

4. Nếu tìm thấy đối sánh thành công, trình duyệt [tạo một báo cáo](/en-US/docs/Web/API/Attribution_Reporting_API/Generating_reports) dựa trên dữ liệu source và trigger, rồi gửi báo cáo đó tới một reporting endpoint.

> [!NOTE]
> Attribution trigger không thể được đăng ký trên phần tử {{htmlelement("a")}} hoặc qua lời gọi {{domxref("Window.open()")}} như attribution source.

## Attribution trigger dựa trên HTML

Attribution trigger dựa trên HTML có thể được dùng để phát hiện lượt chuyển đổi trên một trang khi trang tải lần đầu, hoặc chính xác hơn là khi một phần tử `<img>` hoặc `<script>` tải xong. Ví dụ, nếu người dùng đã nhấp vào một liên kết attribution source trên trang của nhà xuất bản và điều hướng tới trang của nhà quảng cáo, bạn có thể đăng ký attribution trigger và yêu cầu trình duyệt thử đối sánh với các mục source đã lưu ngay khi trang của nhà quảng cáo tải xong.

Bạn có thể đăng ký một attribution trigger bằng cách thêm thuộc tính `attributionsrc` vào phần tử phù hợp. Điều này có thể thực hiện trên phần tử {{htmlelement("img")}} và {{htmlelement("script")}}.

Nếu bạn để giá trị thuộc tính trống, yêu cầu đăng ký sẽ được gửi tới máy chủ lưu trữ tài nguyên được yêu cầu. Cũng có thể chỉ định một URL bổ sung trong giá trị để gửi yêu cầu đăng ký tới; xem [Chỉ định URL bên trong attributionsrc](#chỉ-định-url-bên-trong-attributionsrc) để biết thêm chi tiết.

Đây là ví dụ về phần tử `<img>`:

```html
<img
  src="https://shop.example/conversion/4rghshdh5"
  alt=""
  width="1"
  height="1"
  attributionsrc />
```

Bạn cũng có thể thực hiện điều này qua thuộc tính {{domxref("HTMLImageElement.attributionSrc")}}:

```js
const imgElem = document.querySelector("img");
imgElem.attributionSrc = "";
```

Trong trường hợp này, trình duyệt sẽ cố gắng đối sánh trigger với một attribution source đã lưu khi nó nhận được phản hồi chứa tệp ảnh (khi sự kiện `load` kích hoạt). Hãy lưu ý rằng người dùng không nhất thiết có thể nhìn thấy hình ảnh này; đó có thể chỉ là một pixel theo dõi trong suốt 1x1 chỉ được dùng cho attribution reporting.

Ví dụ về phần tử {{htmlelement("script")}} có thể trông như sau:

```html
<script src="advertising-script.js" attributionsrc></script>
```

```js
const scriptElem = document.querySelector("script");
scriptElem.attributionSrc = "";
```

Trong trường hợp này, trình duyệt sẽ cố gắng đối sánh trigger với một attribution source đã lưu khi nó nhận được phản hồi chứa script.

## Attribution trigger dựa trên JavaScript

Attribution trigger dựa trên JavaScript linh hoạt hơn trigger dựa trên HTML. Bạn có thể kích hoạt trình duyệt thử đối sánh với một source đã lưu dựa trên tương tác tùy chỉnh, ví dụ nhấp vào một phần tử tùy biến hoặc gửi biểu mẫu.

Để đăng ký attribution trigger dựa trên script, bạn có thể:

- Gửi một yêu cầu {{domxref("Window/fetch", "fetch()")}} có chứa tùy chọn `attributionReporting`:

  ```js
  const attributionReporting = {
    eventSourceEligible: false,
    triggerEligible: true,
  };

  // Tùy chọn đặt keepalive để bảo đảm yêu cầu vẫn tồn tại sau khi rời trang
  function triggerMatching() {
    fetch("https://shop.example/endpoint", {
      keepalive: true,
      attributionReporting,
    });
  }

  // Liên kết việc kích hoạt tương tác với phần tử và sự kiện
  // nào phù hợp với mã của bạn
  elem.addEventListener("click", triggerMatching);
  ```

- Gửi một {{domxref("XMLHttpRequest")}} với lời gọi {{domxref("XMLHttpRequest.setAttributionReporting", "setAttributionReporting()")}} trên đối tượng yêu cầu:

  ```js
  const attributionReporting = {
    eventSourceEligible: false,
    triggerEligible: true,
  };

  function triggerMatching() {
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

  // Liên kết việc kích hoạt tương tác với phần tử và sự kiện
  // nào phù hợp với mã của bạn
  elem.addEventListener("click", triggerMatching);
  ```

Trong trường hợp này, trình duyệt sẽ cố gắng đối sánh trigger với attribution source đã lưu khi nó nhận được phản hồi từ yêu cầu fetch.

> [!NOTE]
> Yêu cầu có thể hướng tới bất kỳ tài nguyên nào. Nó không nhất thiết phải liên quan trực tiếp tới Attribution Reporting API, và có thể là yêu cầu lấy JSON, văn bản thuần, blob hình ảnh hoặc bất cứ nội dung nào khác phù hợp với ứng dụng của bạn.

## Chỉ định URL bên trong attributionsrc

Trong các ví dụ ở trên, thuộc tính `attributionsrc` được để trống, nhận giá trị chuỗi rỗng. Điều này ổn nếu máy chủ lưu trữ tài nguyên được yêu cầu cũng chính là máy chủ mà bạn muốn xử lý việc đăng ký, tức là nhận header {{httpheader("Attribution-Reporting-Eligible")}} và phản hồi bằng header {{httpheader("Attribution-Reporting-Register-Trigger")}}.

Tuy nhiên, cũng có thể tài nguyên được yêu cầu không nằm trên máy chủ mà bạn kiểm soát, hoặc bạn chỉ đơn giản muốn xử lý việc đăng ký attribution trigger trên một máy chủ khác. Trong những trường hợp như vậy, bạn có thể chỉ định một hoặc nhiều URL làm giá trị của `attributionsrc`. Khi yêu cầu tài nguyên diễn ra, header {{httpheader("Attribution-Reporting-Eligible")}} sẽ được gửi tới các URL được chỉ định trong `attributionsrc` ngoài origin của tài nguyên; các URL này sau đó có thể phản hồi bằng {{httpheader("Attribution-Reporting-Register-Trigger")}} để hoàn tất đăng ký.

Ví dụ, trong trường hợp phần tử `<img>`, bạn có thể khai báo URL trong thuộc tính `attributionsrc`:

```html
<img
  src="https://shop.example/conversion/4rghshdh5"
  alt=""
  attributionsrc="https://my-separate-tracking-site.example.com"
  width="1"
  height="1" />
```

Hoặc trong JavaScript qua thuộc tính `attributionSrc`:

```js
const imgElem = document.querySelector("img");
imgElem.attributionSrc = "https://my-separate-tracking-site.example.com";
```

## Xem thêm

- [Công cụ kiểm tra Attribution Reporting Header](https://wicg.github.io/attribution-reporting-api/validate-headers)
