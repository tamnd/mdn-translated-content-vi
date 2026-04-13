---
title: "MediaKeySession: phương thức close()"
short-title: close()
slug: Web/API/MediaKeySession/close
page-type: web-api-instance-method
browser-compat: api.MediaKeySession.close
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Phương thức `close()` của giao diện {{domxref('MediaKeySession')}} thông báo rằng phiên phương tiện hiện tại không còn cần thiết, và module giải mã nội dung nên giải phóng mọi tài nguyên liên quan đến đối tượng này và đóng nó. Sau đó, nó trả về một {{jsxref('Promise')}}.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
