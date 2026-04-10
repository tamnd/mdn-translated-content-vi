---
title: "Document: requestStorageAccess() method"
short-title: requestStorageAccess()
slug: Web/API/Document/requestStorageAccess
page-type: web-api-instance-method
browser-compat: api.Document.requestStorageAccess
---

{{APIRef("Storage Access API")}}

Phương thức **`requestStorageAccess()`** của giao diện {{domxref("Document")}} cho phép nội dung tải trong ngữ cảnh bên thứ ba (tức là được nhúng trong một {{htmlelement("iframe")}}) yêu cầu quyền truy cập vào [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) và [trạng thái không phân vùng](/en-US/docs/Web/Privacy/Guides/State_Partitioning#state_partitioning).
Điều này liên quan đến các tác nhân người dùng, theo mặc định, chặn quyền truy cập vào cookie bên thứ ba, [không phân vùng](/en-US/docs/Web/API/Storage_Access_API#unpartitioned_versus_partitioned_cookies) để cải thiện quyền riêng tư (ví dụ: để ngăn chặn theo dõi), và là một phần của [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).

Để kiểm tra xem quyền truy cập cookie bên thứ ba đã được cấp hay chưa, bạn có thể gọi {{domxref("Permissions.query()")}}, chỉ định tên tính năng `"storage-access"`.

Sau khi một nội dung nhúng kích hoạt quyền `storage-access` thông qua `requestStorageAccess()`, nó sẽ tự tải lại.
Trình duyệt sẽ yêu cầu lại tài nguyên với cookie bên thứ ba không phân vùng được bao gồm và cung cấp chúng cho tài nguyên nhúng sau khi tải xong.

Cookie bên thứ ba chỉ được gửi kèm các yêu cầu đến chính nguồn gốc của tài nguyên nhúng.
Các nguồn gốc khác trong cùng một trang web muốn truy cập cookie bên thứ ba của họ sẽ cần _kích hoạt_ quyền storage-access đã được cấp.
Nên sử dụng [các header truy cập storage](/en-US/docs/Web/API/Storage_Access_API#storage_access_headers) để kích hoạt quyền `storage-access` đã được cấp.
Lưu ý rằng các header có thể kích hoạt quyền đã được cấp cho bất kỳ tài nguyên nhúng nào, chẳng hạn như hình ảnh có xác thực, không chỉ mã nhúng trong một {{htmlelement("iframe")}}.

Cũng có thể kích hoạt quyền đã được cấp cho một điểm cuối cùng nguồn gốc, cùng trang web bằng cách gọi `requestStorageAccess()` (lần này không yêu cầu kích hoạt tạm thời).
Tuy nhiên, điều này chỉ hoạt động để kích hoạt quyền cho mã nhúng.
Nó cũng kém hiệu quả hơn so với sử dụng header, vì tài nguyên cần được tải để kích hoạt quyền.

> [!NOTE]
> Việc sử dụng tính năng này có thể bị chặn bởi {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn. Ngoài ra, tài liệu phải vượt qua các kiểm tra cụ thể của trình duyệt như danh sách cho phép, danh sách chặn, phân loại trên thiết bị, cài đặt người dùng, heuristic chống-[clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking), hoặc yêu cầu người dùng cấp quyền rõ ràng.

## Cú pháp

```js-nolint
requestStorageAccess()
requestStorageAccess(types)
```

### Tham số

- `types` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính kiểm soát trạng thái không phân vùng nào được truy cập. Nếu không được chỉ định, giá trị mặc định của thuộc tính là `false`. Các thuộc tính có sẵn như sau:
    - `all`
      - : Một boolean chỉ định tất cả các trạng thái không phân vùng có thể nên được truy cập.
    - `cookies`
      - : Một boolean chỉ định cookie bên thứ ba nên được truy cập.
    - `sessionStorage`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.sessionStorage")}} nên được truy cập.
    - `localStorage`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.localStorage")}} nên được truy cập.
    - `indexedDB`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.indexedDB")}} nên được truy cập.
    - `locks`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.locks")}} nên được truy cập.
    - `caches`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.caches")}} nên được truy cập.
    - `getDirectory`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.getDirectory()")}} nên được truy cập.
    - `estimate`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.estimate()")}} nên được truy cập.
    - `createObjectURL`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.createObjectURL()")}} nên được truy cập.
    - `revokeObjectURL`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.revokeObjectURL()")}} nên được truy cập.
    - `BroadcastChannel`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.BroadcastChannel()")}} nên được truy cập.
    - `SharedWorker`
      - : Một boolean chỉ định {{domxref("StorageAccessHandle.SharedWorker()")}} nên được truy cập.

### Giá trị trả về

Một {{jsxref("Promise")}} thỏa mãn với `undefined` nếu quyền truy cập cookie bên thứ ba được cấp và không có tham số `types` nào được cung cấp, thỏa mãn với {{domxref("StorageAccessHandle")}} nếu quyền truy cập trạng thái không phân vùng được yêu cầu bởi tham số `types` được cung cấp, và từ chối nếu quyền truy cập bị từ chối.

Các yêu cầu `requestStorageAccess()` tự động bị từ chối trừ khi nội dung nhúng hiện đang xử lý một cử chỉ người dùng như nhấn hoặc nhấp ({{Glossary("transient activation")}}), hoặc trừ khi quyền đã được cấp trước đó. Nếu quyền chưa được cấp trước đó, chúng cần được chạy bên trong một trình xử lý sự kiện dựa trên cử chỉ người dùng. Hành vi cử chỉ người dùng phụ thuộc vào trạng thái của promise:

- Nếu promise được giải quyết (tức là quyền được cấp), thì cử chỉ người dùng chưa bị tiêu thụ, do đó tập lệnh có thể gọi các API yêu cầu cử chỉ người dùng sau đó.
- Nếu promise bị từ chối (tức là quyền không được cấp), thì cử chỉ người dùng đã bị tiêu thụ, do đó tập lệnh không thể làm bất cứ điều gì yêu cầu một cử chỉ. Đây là sự bảo vệ có chủ đích chống lại việc lạm dụng — nó ngăn các tập lệnh gọi `requestStorageAccess()` trong một vòng lặp cho đến khi người dùng chấp nhận lời nhắc.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - {{domxref("Document")}} hiện tại chưa hoạt động.
    - Tham số `types` được cung cấp và tất cả các thuộc tính của nó đều là `false`.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - Cửa sổ của tài liệu không phải là [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts).
    - Việc sử dụng bị chặn bởi {{httpheader("Permissions-Policy/storage-access", "storage-access")}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
    - Tài liệu hoặc tài liệu cấp cao nhất có nguồn gốc `null`.
    - {{htmlelement("iframe")}} nhúng bị sandbox và token `allow-storage-access-by-user-activation` không được đặt.
    - Việc sử dụng bị tác nhân người dùng từ chối bởi yêu cầu quyền sử dụng API.

## Ví dụ

### Sử dụng cơ bản

```js
document.requestStorageAccess().then(
  () => {
    console.log("cookie access granted");
  },
  () => {
    console.log("cookie access denied");
  },
);

document.requestStorageAccess({ localStorage: true }).then(
  (handle) => {
    console.log("localStorage access granted");
    handle.localStorage.setItem("foo", "bar");
  },
  () => {
    console.log("localStorage access denied");
  },
);
```

> [!NOTE]
> Xem [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using) để biết ví dụ đầy đủ hơn.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.hasStorageAccess()")}}, {{domxref("Document.hasUnpartitionedCookieAccess()")}}, {{domxref("Document.requestStorageAccessFor()")}}
- [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using)
- [Introducing Storage Access API](https://webkit.org/blog/8124/introducing-storage-access-api/) (bài viết WebKit)
