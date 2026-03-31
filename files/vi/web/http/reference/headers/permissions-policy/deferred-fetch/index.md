---
title: "Permissions-Policy: chỉ thị deferred-fetch"
short-title: deferred-fetch
slug: Web/HTTP/Reference/Headers/Permissions-Policy/deferred-fetch
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.deferred-fetch
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị **`deferred-fetch`** của {{HTTPHeader("Permissions-Policy")}} là một phần của [Fetch API](/en-US/docs/Web/API/Fetch_API).

Chỉ thị này, cùng với {{HTTPHeader("Permissions-Policy/deferred-fetch-minimal", "deferred-fetch-minimal")}}, xác định cách phân phối giới hạn hạn mức tổng thể 640KiB giữa nguồn gốc cấp cao nhất và các subframe cross-origin của nó. Theo mặc định, nguồn gốc cấp cao nhất được cấp 512KiB, và mỗi subframe cross-origin được cấp 8KiB từ phần còn lại 128KiB. Permissions Policy `deferred-fetch` có thể cho phép các nguồn gốc subframe được cấp hạn mức lớn hơn 64KiB từ hạn mức 512KiB cấp cao nhất thay vì hạn mức tối thiểu 8KiB mà chúng sẽ nhận theo mặc định.

Xem [hạn mức `fetchLater()`](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch#quotas) để biết thêm chi tiết và ví dụ.

## Cú pháp

```http
Permissions-policy: deferred-fetch=(self)
Permissions-policy: deferred-fetch=(self <url-list>)
Permissions-policy: deferred-fetch=(<url-list>)
```

- `<url-list>`
  - : Danh sách các nguồn gốc được phân cách bằng dấu cách (mỗi nguồn gốc được đặt trong dấu ngoặc kép) được cấp hạn mức cao hơn là 64KiB lấy từ hạn mức chính của cha. Hạn mức 64KiB được lấy tại thời điểm subframe được tạo.

Một subframe cross-origin có thể cấp `deferred-fetch` cho một trong các subframe con cross-origin của nó, ủy quyền toàn bộ hạn mức của nó. Điều này chỉ hoạt động nếu không có hạn mức nào hiện đang được sử dụng.

Kiểm tra Permissions Policy không thể phân biệt với kiểm tra hạn mức. Gọi `fetchLater()` sẽ ném `QuotaExceededError` cả khi hạn mức thực sự bị vượt quá và khi hạn mức bị hạn chế cho nguồn gốc đó thông qua Permissions Policy.

## Chính sách mặc định

Danh sách cho phép mặc định cho `deferred-fetch` là `self`.

## Ví dụ

Xem [hạn mức `fetchLater()`](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch#quotas) để biết thêm ví dụ.

### Sử dụng hạn mức tối thiểu

```http
Permissions-Policy: deferred-fetch=(self "https://b.com")
```

1. Một subframe của `b.com` nhận 64KiB khi tạo, từ giới hạn 512KiB của cấp cao nhất.
2. Một subframe của `c.com` không được liệt kê và vì vậy nhận 8KiB khi tạo từ giới hạn chia sẻ 128KiB.
3. 15 subframe khác của các nguồn gốc khác nhau sẽ nhận 8KiB khi tạo (tương tự `c.com`).
4. Subframe tiếp theo sẽ không được cấp hạn mức nào.
5. Nếu một trong các subframe bị xóa, các fetch bị trì hoãn của nó sẽ được gửi.
6. Subframe tiếp theo sẽ nhận hạn mức 8KiB, vì có hạn mức có sẵn trở lại.

## Thu hồi hoàn toàn hạn mức tối thiểu

```http
Permissions-Policy: deferred-fetch=(self "https://b.com")
Permissions-Policy: deferred-fetch-minimal=()
```

1. Một subframe của `b.com` nhận 64KiB khi tạo.
2. Một subframe của `c.com` không nhận hạn mức khi tạo.
3. Tài liệu cấp cao nhất và các hậu duệ cùng nguồn gốc của nó có thể sử dụng tối đa 640KiB đầy đủ, nhưng con số đó giảm xuống còn 574KiB nếu một subframe `b.com` được tạo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- {{domxref("window.fetchLater()")}}
- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
