---
title: "Document: phương thức hasUnpartitionedCookieAccess()"
short-title: hasUnpartitionedCookieAccess()
slug: Web/API/Document/hasUnpartitionedCookieAccess
page-type: web-api-instance-method
browser-compat: api.Document.hasUnpartitionedCookieAccess
---

{{APIRef("Storage Access API")}}

Phương thức **`hasUnpartitionedCookieAccess()`** của giao diện {{domxref("Document")}} trả về một {{jsxref("Promise")}} phân giải với một giá trị boolean cho biết liệu tài liệu có quyền truy cập vào [third-party](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) cookie [unpartitioned](/en-US/docs/Web/API/Storage_Access_API#unpartitioned_versus_partitioned_cookies) hay không.

Phương thức này là một phần của [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).

Phương thức này là tên mới của {{DOMxRef("Document.hasStorageAccess()")}}.

## Cú pháp

```js-nolint
hasUnpartitionedCookieAccess()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với một giá trị boolean cho biết liệu tài liệu có quyền truy cập vào third-party cookie — `true` nếu có, và `false` nếu không.

Xem {{DOMxRef("Document.hasStorageAccess()")}} để biết thêm chi tiết.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Document")}} hiện tại chưa hoạt động.

## Ví dụ

```js
document.hasUnpartitionedCookieAccess().then((hasAccess) => {
  if (hasAccess) {
    // quyền truy cập storage đã được cấp.
    console.log("truy cập cookie được cấp");
  } else {
    // quyền truy cập storage chưa được cấp;
    // bạn có thể muốn gọi requestStorageAccess().
    console.log("truy cập cookie bị từ chối");
  }
});
```

> [!NOTE]
> Xem [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using) để biết ví dụ đầy đủ hơn.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.hasStorageAccess()")}}, {{domxref("Document.requestStorageAccess()")}}, {{domxref("Document.requestStorageAccessFor()")}}
- [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using)
- [Giới thiệu Storage Access API](https://webkit.org/blog/8124/introducing-storage-access-api/) (bài viết WebKit)
