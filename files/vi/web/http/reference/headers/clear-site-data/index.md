---
title: Clear-Site-Data header
short-title: Clear-Site-Data
slug: Web/HTTP/Reference/Headers/Clear-Site-Data
page-type: http-header
browser-compat: http.headers.Clear-Site-Data
sidebar: http
---

{{securecontext_header}}

Tiêu đề HTTP **`Clear-Site-Data`** {{Glossary("response header", "phản hồi")}} gửi tín hiệu cho máy khách rằng nó nên xóa tất cả dữ liệu trình duyệt của một số loại nhất định (cookie, storage, cache) liên quan đến trang web đang yêu cầu.
Nó cho phép các nhà phát triển web có nhiều quyền kiểm soát hơn đối với dữ liệu được trình duyệt lưu trữ cho các nguồn gốc của họ.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
// Chỉ thị đơn
Clear-Site-Data: "cache"

// Nhiều chỉ thị (phân tách bằng dấu phẩy)
Clear-Site-Data: "cache", "cookies"

// Ký tự đại diện
Clear-Site-Data: "*"
```

## Chỉ thị

> [!NOTE]
> Tất cả các chỉ thị phải tuân thủ [ngữ pháp chuỗi được trích dẫn](https://datatracker.ietf.org/doc/html/rfc7230#section-3.2.6). Chỉ thị không bao gồm dấu nháy kép là không hợp lệ.

- `"cache"`
  - : Máy chủ báo hiệu rằng máy khách nên xóa dữ liệu được lưu vào bộ nhớ đệm cục bộ (bộ nhớ đệm trình duyệt, xem [HTTP caching](/en-US/docs/Web/HTTP/Guides/Caching)) cho nguồn gốc của URL phản hồi.

- `"clientHints"` {{Experimental_Inline}}
  - : Chỉ ra rằng máy chủ sẽ xóa tất cả [client hints](/en-US/docs/Web/HTTP/Guides/Client_hints) (được yêu cầu qua {{HTTPHeader("Accept-CH")}}) được lưu trữ cho nguồn gốc của URL phản hồi.

- `"cookies"`
  - : Máy chủ báo hiệu rằng máy khách nên xóa tất cả cookie cho nguồn gốc của URL phản hồi. Thông tin xác thực HTTP cũng bị xóa. Điều này ảnh hưởng đến toàn bộ tên miền đã đăng ký, bao gồm các tên miền con.

- `"executionContexts"` {{Experimental_Inline}}
  - : Máy chủ báo hiệu rằng máy khách nên tải lại tất cả ngữ cảnh trình duyệt cho nguồn gốc của phản hồi ({{domxref("Location.reload")}}).

- `"prefetchCache"` {{experimental_inline}} {{non-standard_inline}}
  - : Được sử dụng để xóa các prefetch {{domxref("Speculation Rules API", "speculation rules", "", "nocode")}} có phạm vi đến nguồn gốc referrer.

- `"prerenderCache"` {{experimental_inline}} {{non-standard_inline}}
  - : Được sử dụng để xóa các prerender {{domxref("Speculation Rules API", "speculation rules","", "nocode")}} có phạm vi đến nguồn gốc referrer.

- `"storage"`
  - : Máy chủ báo hiệu rằng máy khách nên xóa tất cả DOM storage cho nguồn gốc của URL phản hồi. Điều này bao gồm các cơ chế lưu trữ như:
    - localStorage (thực thi `localStorage.clear`),
    - sessionStorage (thực thi `sessionStorage.clear`),
    - IndexedDB (cho mỗi cơ sở dữ liệu thực thi {{domxref("IDBFactory.deleteDatabase")}}),
    - Đăng ký service worker (cho mỗi đăng ký service worker, thực thi {{domxref("ServiceWorkerRegistration.unregister")}}),
    - Web SQL databases (không còn dùng nữa),
    - [Dữ liệu FileSystem API](/en-US/docs/Web/API/File_and_Directory_Entries_API),
    - Dữ liệu Plugin (Flash qua [`NPP_ClearSiteData`](https://wiki.mozilla.org/NPAPI:ClearSiteData)).

- `"*"` (ký tự đại diện)
  - : Máy chủ báo hiệu rằng máy khách nên xóa tất cả loại dữ liệu cho nguồn gốc của URL phản hồi. Nếu có thêm các loại dữ liệu trong các phiên bản tương lai của tiêu đề này, chúng cũng sẽ được đề cập.

## Ví dụ

### Đăng xuất khỏi trang web

Nếu người dùng đăng xuất khỏi trang web hoặc dịch vụ của bạn, bạn có thể muốn xóa dữ liệu được lưu trữ cục bộ, bao gồm bất kỳ nội dung được prefetch hoặc prerender cho {{domxref("Speculation Rules API", "các điều hướng suy đoán","", "nocode")}}.
Để làm điều này, thêm tiêu đề `Clear-Site-Data` vào trang xác nhận đăng xuất thành công (`https://example.com/logout`, ví dụ):

```http
Clear-Site-Data: "cache", "cookies", "storage", "executionContexts", "prefetchCache", "prerenderCache"
```

### Xóa cookie

Nếu tiêu đề này được gửi với phản hồi tại `https://example.com/clear-cookies`, tất cả cookie trên cùng tên miền `https://example.com` và bất kỳ tên miền con nào (như `https://stage.example.com`, v.v.), sẽ bị xóa.

```http
Clear-Site-Data: "cookies"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Cache-Control")}}
