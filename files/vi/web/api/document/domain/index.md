---
title: "Document: thuộc tính domain"
short-title: domain
slug: Web/API/Document/domain
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.domain
---

{{APIRef("DOM")}}{{Deprecated_Header}}

Thuộc tính **`domain`** của giao diện {{domxref("Document")}} lấy/đặt phần domain của {{glossary("origin")}} của tài liệu hiện tại, được sử dụng bởi [same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy).

## Giá trị

Một chuỗi.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Tài liệu bị cấm đặt domain của nó, ví dụ như bị sandbox hoặc có origin không rõ ràng. Xem [phần Failures](#failures) để biết chi tiết.

## Ví dụ

### Lấy domain

Đối với mã chạy tại URL `https://developer.mozilla.org/en-US/docs/Web`, ví dụ này sẽ đặt `currentDomain` thành chuỗi `"developer.mozilla.org"`.

```js
const currentDomain = document.domain;
```

Getter của thuộc tính này trả về phần domain của origin của tài liệu hiện tại. Trong hầu hết các trường hợp, đây sẽ là phần hostname của URL tài liệu. Tuy nhiên, có một số ngoại lệ:

- Nếu trang có {{glossary("origin")}} không rõ ràng, ví dụ: đối với trang có [data URL](/en-US/docs/Web/URI/Reference/Schemes/data), thì nó sẽ trả về chuỗi rỗng.
- Nếu [setter](#setting_the_domain) `document.domain` đã được sử dụng, thì nó sẽ trả về giá trị đã được đặt.

Mặc dù getter không nguy hiểm theo cách giống như setter, nhưng có lẽ đơn giản và hữu ích hơn khi sử dụng thuộc tính {{domxref("Location.hostname")}}. Sau đó bạn có thể tránh sử dụng `document.domain` hoàn toàn:

```js
const currentHostname = location.hostname;
```

Đối với URL `https://developer.mozilla.org/en-US/docs/Web`, `currentHostname` cũng là chuỗi `"developer.mozilla.org"`. Các lựa chọn thay thế khác cung cấp thông tin hơi khác một chút là {{domxref("Location.host")}}, bao gồm port, và {{domxref("Window.origin")}}, cung cấp origin đầy đủ.

### Đặt domain

```js
document.domain = domainString;
```

Setter của thuộc tính này có thể được sử dụng để _thay đổi_ {{glossary("origin")}} của một trang, và do đó sửa đổi cách certain security checks được thực hiện. Nó chỉ có thể được đặt thành cùng một domain hoặc domain cha. Ví dụ: nếu cả `https://a.example.com` và `https://b.example.com` đều sử dụng

```js
document.domain = "example.com";
```

thì cả hai đều đã sửa đổi origin của chúng để có cùng domain, và giờ chúng có thể truy cập DOM của nhau trực tiếp — mặc dù là cross-origin, điều mà thông thường sẽ ngăn chặn việc truy cập như vậy.

Lưu ý rằng việc đặt `document.domain` thành giá trị hiện tại của nó không phải là một no-op. Nó vẫn thay đổi origin. Ví dụ: nếu một trang đặt

```js
document.domain = document.domain;
```

thì nó sẽ được tính là cross-origin từ bất kỳ trang nào khác cùng origin bình thường mà chưa làm điều tương tự.

#### Deprecation

Setter `document.domain` đã bị deprecate. Nó làm suy yếu các bảo mật được cung cấp bởi [same origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy), và làm phức tạp mô hình origin trong trình duyệt, dẫn đến các vấn đề về khả năng tương tác và lỗi bảo mật.

Việc cố gắng đặt `document.domain` là nguy hiểm. Nó mở quyền truy cập đầy đủ vào DOM của một trang từ _tất cả_ các subdomain, điều này có lẽ không phải là ý định của bạn. Nó cũng xóa phần port khỏi origin, vì vậy giờ trang của bạn có thể được truy cập bởi các trang khác có cùng địa chỉ IP hoặc cùng phần host, ngay cả trên một port khác.

Điều này đặc biệt không an toàn trên shared hosting. Ví dụ: một khách hàng shared hosting khác có thể host một trang tại cùng địa chỉ IP nhưng trên một port khác, sau đó việc đặt `document.domain` sẽ xóa bảo vệ same-origin thường bảo vệ bạn khỏi trang của khách hàng khác đó truy cập dữ liệu trang của bạn.

Các vấn đề tương tự xảy ra với các trang shared hosting cung cấp cho mỗi khách hàng một subdomain khác nhau. Nếu một trang đặt `document.domain`, bất kỳ khách hàng nào khác trên một subdomain khác giờ có thể làm điều tương tự và bắt đầu truy cập dữ liệu của trang gốc.

Thay vì sử dụng `document.domain` để tạo điều kiện giao tiếp cross-origin, bạn nên sử dụng {{domxref("Window.postMessage")}} để gửi tin nhắn không đồng bộ đến origin khác. Việc truy cập có kiểm soát thông qua message-passing này an toàn hơn nhiều so với việc phơi bày toàn bộ dữ liệu do `document.domain` gây ra.

#### Failures

Setter sẽ ném ra `SecurityError` {{domxref("DOMException")}} trong một số trường hợp:

- Tài liệu nằm trong {{htmlelement("iframe")}} sandbox.
- Tài liệu không có {{glossary("browsing context")}}.
- [effective domain](https://html.spec.whatwg.org/multipage/origin.html#concept-origin-effective-domain) của tài liệu là `null`.
- Giá trị đã cho không giống với hostname hiện tại của trang, cũng không phải là domain cha của nó.

Ví dụ cho trường hợp thất bại cuối cùng này, cố gắng đặt `document.domain` thành `"example.org"` khi đang ở `https://example.com/` sẽ ném lỗi.

Ngoài ra, như một phần của việc deprecation, nó sẽ không làm gì khi kết hợp với certain tính năng isolation hiện đại:

- Nếu được sử dụng trên một trang cross-origin isolated, tức là trang sử dụng các giá trị phù hợp cho các HTTP header {{httpheader("Cross-Origin-Opener-Policy")}} và {{httpheader("Cross-Origin-Embedder-Policy")}}
- Nếu được sử dụng trên một trang origin-isolated, tức là trang sử dụng HTTP header {{httpheader("Origin-Agent-Cluster")}} {{experimental_inline}}

Cuối cùng, việc đặt `document.domain` không thay đổi origin được sử dụng cho các kiểm tra origin bởi một số Web API, ngăn chặn truy cập subdomain thông qua cơ chế này. Các API bị ảnh hưởng bao gồm (nhưng không giới hạn): {{domxref("Window.localStorage")}}, [IndexDB API](/en-US/docs/Web/API/IndexedDB_API), {{domxref("BroadcastChannel")}}, {{domxref("SharedWorker")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy)
- {{domxref("Location.hostname")}}
- {{domxref("Location.host")}}
- {{domxref("Window.origin")}}
