---
title: Cross-Origin-Embedder-Policy (COEP) header
short-title: Cross-Origin-Embedder-Policy
slug: Web/HTTP/Reference/Headers/Cross-Origin-Embedder-Policy
page-type: http-header
browser-compat: http.headers.Cross-Origin-Embedder-Policy
sidebar: http
---

Tiêu đề HTTP **`Cross-Origin-Embedder-Policy`** (COEP) {{Glossary("response header")}} cấu hình chính sách của tài liệu hiện tại để tải và nhúng các tài nguyên khác nguồn gốc được yêu cầu ở chế độ `no-cors`.

Lưu ý rằng chính sách nhúng cho các yêu cầu được thực hiện ở chế độ `cors` được kiểm soát bởi [CORS](/en-US/docs/Web/HTTP/Guides/CORS).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Cross-Origin-Embedder-Policy: <token>; <parameter>
```

### Chỉ thị

Tiêu đề chỉ nên được đặt với một token và một tham số `report-to` tùy chọn.
Đặt tiêu đề nhiều lần hoặc với nhiều token tương đương với việc đặt `unsafe-none`.

Giá trị `<token>` có thể là một trong:

- `unsafe-none`
  - : Cho phép tài liệu tải các tài nguyên được yêu cầu ở chế độ `no-cors` **mà không** cần cấp quyền rõ ràng thông qua tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}}.
    Đây là giá trị mặc định.

- `require-corp`
  - : Tài liệu chỉ có thể tải các tài nguyên được yêu cầu ở chế độ `no-cors` từ cùng nguồn gốc, hoặc các tài nguyên đã đặt rõ ràng tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}} với giá trị cho phép nhúng.

    Việc tải tài nguyên khác nguồn gốc sẽ bị COEP chặn trừ khi:
    - Tài nguyên được yêu cầu ở chế độ `no-cors` và phản hồi bao gồm tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}} cho phép tải vào nguồn gốc tài liệu.
    - Tài nguyên được yêu cầu ở chế độ `cors`; ví dụ: trong HTML sử dụng thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin), hoặc trong JavaScript bằng cách gửi yêu cầu với [`{mode="cors"}`](/en-US/docs/Web/API/RequestInit#cors).
      Lưu ý rằng các yêu cầu được thực hiện ở chế độ `cors` sẽ không bị COEP chặn hoặc kích hoạt vi phạm COEP, nhưng vẫn phải được CORS cho phép.

- `credentialless`
  - : Tài liệu có thể tải các tài nguyên khác nguồn gốc được yêu cầu ở [chế độ `no-cors`](/en-US/docs/Web/API/Request/mode) **mà không** cần quyền rõ ràng thông qua tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}}.
    Trong trường hợp này, các yêu cầu được gửi mà không có thông tin xác thực: cookie bị bỏ qua trong yêu cầu và bị bỏ qua trong phản hồi.

    Hành vi tải khác nguồn gốc cho các [chế độ yêu cầu](/en-US/docs/Web/API/Request/mode#cors) khác giống như đối với [`require-corp`](#require-corp).
    Ví dụ: một tài nguyên khác nguồn gốc được yêu cầu ở chế độ `cors` phải hỗ trợ (và được CORS cho phép).

Tham số `<parameter>` là tùy chọn và có thể là:

- `report-to <endpoint_name>` {{optional_inline}}
  - : `<endpoint_name>` là tên của điểm cuối mà các vi phạm chính sách sẽ được gửi đến.
    Ánh xạ giữa tên và một điểm cuối cụ thể được xác định riêng trong tiêu đề HTTP {{httpheader("Reporting-Endpoints")}}.

## Mô tả

Chính sách về việc một tài nguyên cụ thể có thể được nhúng khác trang web có thể được xác định cho tài nguyên đó bằng tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}} (CORP) trong phản hồi cho một yêu cầu `no-cors`, hoặc bằng [CORS](/en-US/docs/Web/HTTP/Guides/CORS).
Nếu không có chính sách nào trong số này được đặt, thì theo mặc định, các tài nguyên có thể được tải hoặc nhúng vào tài liệu như thể chúng có giá trị CORP là `cross-origin` (nghĩa là chúng _có thể_ được tải khác nguồn gốc).

**`Cross-Origin-Embedder-Policy`** cho phép bạn yêu cầu rằng tiêu đề CORP phải được đặt, trong các phản hồi cho yêu cầu `no-cors`, để tải các tài nguyên khác trang web vào tài liệu hiện tại.
Bạn cũng có thể đặt chính sách để giữ hành vi mặc định, hoặc để cho phép các tài nguyên được tải, nhưng loại bỏ bất kỳ thông tin xác thực nào có thể được gửi.
Chính sách áp dụng cho các tài nguyên đã tải, và các tài nguyên trong {{htmlelement("iframe")}} và các khung lồng nhau.

> [!NOTE]
> `Cross-Origin-Embedder-Policy` không ghi đè hoặc ảnh hưởng đến hành vi nhúng của tài nguyên mà CORP hoặc CORS đã được đặt.
> Nếu CORP hạn chế tài nguyên chỉ được nhúng `same-origin`, nó sẽ không được tải khác nguồn gốc vào tài nguyên — bất kể giá trị COEP.

### Cách ly khác nguồn gốc

COEP và CORS cùng nhau đảm bảo rằng tiến trình trình duyệt chỉ chứa các tài nguyên đã đồng ý được chia sẻ, hoặc không chứa dữ liệu riêng tư.
Đây là một trong những điều kiện cần thiết để tài liệu được [cách ly khác nguồn gốc](/en-US/docs/Web/API/Window/crossOriginIsolated).

### Báo cáo vi phạm

Các vi phạm chính sách có thể được báo cáo bằng [API Báo cáo](/en-US/docs/Web/API/Reporting_API).
Báo cáo có thể được quan sát trong trang mà chính sách đang được đặt bằng [`ReportingObserver`](/en-US/docs/Web/API/ReportingObserver), và gửi đến các điểm cuối máy chủ được xác định trong tiêu đề phản hồi HTTP {{HTTPHeader("Reporting-Endpoints")}} và được chọn bằng tham số [`report-to`](#report-to_endpoint_name).
Để biết thêm thông tin, xem {{domxref("COEPViolationReport")}}.

## Ví dụ

### Chặn và báo cáo khi tài nguyên không đặt tiêu đề CORP

Ví dụ này hiển thị tài liệu chặn việc tải các tài nguyên được yêu cầu ở chế độ [no-cors](/en-US/docs/Web/API/Request/mode#no-cors) mà không đặt tiêu đề CORP phù hợp.

Tài liệu là tệp HTML được lưu trữ trên nguồn gốc `https://example.com`, và bao gồm trong phần thân một phần tử {{htmlelement("img")}} đặt làm nguồn tài nguyên `some-image.png` (khác nguồn gốc).
Vì phần tử không có [thuộc tính `cross-origin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin), nó sẽ được yêu cầu ở chế độ `no-cors`:

```html
<img src="https://another-example.com/some-image.png" />
```

Tiêu đề phản hồi cho tài liệu đặt `Cross-Origin-Embedder-Policy` và tiêu đề {{httpheader("Reporting-Endpoints")}} như hiển thị bên dưới.
Vì chỉ thị `require-corp` được đặt, tất cả tài nguyên khác nguồn gốc được yêu cầu ở chế độ `no-cors` phải được phục vụ với tiêu đề CORP.
Tham số `report-to` chỉ định tên `"coep-endpoint"` là tên của điểm cuối nơi báo cáo nên được gửi, và `Reporting-Endpoints` chỉ định cách tên đó ánh xạ đến một URL cụ thể.

```http
Reporting-Endpoints: coep-endpoint="https://some-example.com/coep"
Cross-Origin-Embedder-Policy: require-corp; report-to="coep-endpoint"
```

Để `some-image.png` được tải mà không kích hoạt vi phạm, nó cần đặt {{HTTPHeader("Cross-Origin-Resource-Policy")}} thành `cross-origin`.
Nếu chúng ta bỏ qua tiêu đề hoặc không bao gồm nó là `cross-origin`, một vi phạm sẽ xảy ra.

Báo cáo được gửi trong yêu cầu POST báo cáo sẽ tương tự như đối tượng JSON hiển thị bên dưới:

```json
[
  {
    "age": 717139,
    "body": {
      "blockedURL": "https://another-example.com/some-image.png",
      "destination": "image",
      "disposition": "enforce",
      "type": "corp"
    },
    "type": "coep",
    "url": "https://example.com",
    "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36"
  }
]
```

`type` của báo cáo là `coep`, và `url` là tài liệu nơi vi phạm xảy ra.
`body` của báo cáo cung cấp URL của tài nguyên bị chặn (`blockedURL`), đích của nó (`image`), loại vi phạm (`corp`), và rằng báo cáo là cho vi phạm được thực thi (`disposition`).

### Các tính năng phụ thuộc vào cách ly khác nguồn gốc

Một số tính năng nhất định, chẳng hạn như truy cập đối tượng {{jsxref("SharedArrayBuffer")}} hoặc sử dụng {{domxref("Performance.now()")}} với bộ đếm thời gian không bị giới hạn, chỉ khả dụng nếu tài liệu của bạn được {{domxref("Window.crossOriginIsolated","cách ly khác nguồn gốc","","nocode")}}.

Để sử dụng các tính năng này trong tài liệu, bạn cần đặt tiêu đề COEP với giá trị `require-corp` hoặc `credentialless`, và tiêu đề {{HTTPHeader("Cross-Origin-Opener-Policy")}} thành `same-origin`.
Ngoài ra, tính năng không được chặn bởi {{HTTPHeader("Permissions-Policy/cross-origin-isolated","Permissions-Policy: cross-origin-isolated")}}.

```http
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```

Bạn có thể sử dụng các thuộc tính {{domxref("Window.crossOriginIsolated")}} và {{domxref("WorkerGlobalScope.crossOriginIsolated")}} để kiểm tra xem các tính năng có bị hạn chế trong ngữ cảnh window và worker hay không:

```js
const myWorker = new Worker("worker.js");

if (crossOriginIsolated) {
  const buffer = new SharedArrayBuffer(16);
  myWorker.postMessage(buffer);
} else {
  const buffer = new ArrayBuffer(16);
  myWorker.postMessage(buffer);
}
```

### Tránh bị COEP chặn với CORS

Nếu bạn bật COEP bằng `require-corp` và muốn nhúng tài nguyên khác nguồn gốc hỗ trợ [CORS](/en-US/docs/Web/HTTP/Guides/CORS), bạn cần chỉ định rõ ràng rằng nó được yêu cầu ở chế độ `cors`.

Ví dụ: để tải một hình ảnh được khai báo trong HTML từ trang web bên thứ ba hỗ trợ CORS, bạn có thể sử dụng thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để nó được yêu cầu ở chế độ `cors`:

```html
<img src="https://thirdparty.com/img.png" crossorigin />
```

Bạn cũng có thể sử dụng thuộc tính [`HTMLScriptElement.crossOrigin`](/en-US/docs/Web/API/HTMLScriptElement/crossOrigin) hoặc fetch với `{ mode: 'cors' }` để yêu cầu tệp ở chế độ CORS bằng JavaScript.

Nếu CORS không được hỗ trợ cho một số hình ảnh, giá trị COEP `credentialless` có thể được sử dụng như một thay thế để tải hình ảnh mà không cần đồng ý rõ ràng từ máy chủ khác nguồn gốc, với chi phí là yêu cầu mà không có cookie.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Cross-Origin-Embedder-Policy-Report-Only")}}
- {{HTTPHeader("Cross-Origin-Opener-Policy")}}
- {{domxref("Window.crossOriginIsolated")}} và {{domxref("WorkerGlobalScope.crossOriginIsolated")}}
- {{domxref("ReportingObserver")}}
- {{domxref("COEPViolationReport")}}
- [API Báo cáo](/en-US/docs/Web/API/Reporting_API)
- [Cross Origin Opener Policy](https://web.dev/articles/why-coop-coep#coep) trong _Why you need "cross-origin isolated" for powerful features_ trên web.dev (2020)
- [COOP and COEP explained: Artur Janc, Charlie Reis, Anne van Kesteren](https://docs.google.com/document/d/1zDlfvfTJ_9e8Jdc8ehuV4zMEu9ySMCiTGMS9y0GU92k/edit?tab=t.0) (2020)
