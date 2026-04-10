---
title: "Document: phương thức hasStorageAccess()"
short-title: hasStorageAccess()
slug: Web/API/Document/hasStorageAccess
page-type: web-api-instance-method
browser-compat: api.Document.hasStorageAccess
---

{{APIRef("Storage Access API")}}

Phương thức **`hasStorageAccess()`** của giao diện {{domxref("Document")}} trả về một {{jsxref("Promise")}} phân giải với một giá trị boolean cho biết liệu tài liệu có quyền truy cập vào [third-party](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) cookie [unpartitioned](/en-US/docs/Web/API/Storage_Access_API#unpartitioned_versus_partitioned_cookies) hay không.

Phương thức này là một phần của [Storage Access API](/en-US/docs/Web/API/Storage_Access_API).

> [!NOTE]
> Phương thức này là một tên khác của {{DOMxRef("Document.hasUnpartitionedCookieAccess()")}}. Không có kế hoạch hiện tại để loại bỏ phương thức này để ủng hộ {{DOMxRef("Document.hasUnpartitionedCookieAccess()")}}.

## Cú pháp

```js-nolint
hasStorageAccess()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với một giá trị boolean cho biết liệu tài liệu có quyền truy cập vào third-party cookie — `true` nếu có, và `false` nếu không.

Kết quả trả về bởi phương thức này có thể không chính xác trong một vài trường hợp:

1. Người dùng có thể có cài đặt trình duyệt đang hoạt động chặn third-party cookie; trong trường hợp này, `true` có thể được trả về mặc dù third-party cookie vẫn không thể truy cập. Để xử lý tình huống này, bạn nên xử lý gracefully bất kỳ lỗi nào dẫn đến giá trị cookie không thể truy xuất; ví dụ: thông báo cho người dùng rằng quyền truy cập vào cài đặt cá nhân hóa của họ bị chặn và mời họ đăng nhập lại để sử dụng.
2. Trình duyệt có thể không chặn quyền truy cập third-party cookie theo mặc định; trong trường hợp này, `false` có thể được trả về mặc dù third-party cookie có thể truy cập, và không cần yêu cầu quyền truy cập storage (tức là, qua {{domxref("Document.requestStorageAccess()")}}). Để giải quyết vấn đề này, bạn có thể truy vấn {{domxref("Document.cookie")}} để tìm hiểu xem cookie của bạn có thể truy cập không, và gọi {{domxref("Document.requestStorageAccess()")}} nếu không.

> [!NOTE]
> Nếu promise được phân giải và một sự kiện user gesture đang được xử lý khi hàm ban đầu được gọi, trình xử lý phân giải sẽ chạy như thể một user gesture đang được xử lý, vì vậy nó sẽ có thể gọi các API yêu cầu user activation.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Document")}} hiện tại chưa hoạt động.

## Ví dụ

```js
document.hasStorageAccess().then((hasAccess) => {
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

- {{domxref("Document.hasUnpartitionedCookieAccess()")}}, {{domxref("Document.requestStorageAccess()")}}, {{domxref("Document.requestStorageAccessFor()")}}
- [Sử dụng Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using)
- [Giới thiệu Storage Access API](https://webkit.org/blog/8124/introducing-storage-access-api/) (bài viết WebKit)
