---
title: id
slug: Web/Progressive_web_apps/Manifest/Reference/id
page-type: web-manifest-member
browser-compat: manifests.webapp.id
sidebar: pwasidebar
---

Thành viên manifest `id` được dùng để chỉ định một định danh duy nhất cho ứng dụng web của bạn.

## Cú pháp

```json-nolint
/* URL tuyệt đối */
"id": "https://example.com/myapp"

/* URL tương đối */
"id": "myapp/v2"

/* URL có tham số truy vấn */
"id": "myapp?version=2&mode=trial"
```

### Giá trị

- `id`
  - : Một chuỗi có dạng URL.
    URL phải cùng origin với [`start_url`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/start_url) của ứng dụng web.
    Nếu `id` là URL tương đối, nó được phân giải bằng origin của `start_url`. Bất kỳ fragment nào trong `id` luôn bị bỏ qua.
    Nếu `id` không được chỉ định hoặc giá trị không hợp lệ theo bất kỳ cách nào (chẳng hạn không phải chuỗi, không phải URL hợp lệ, không cùng origin với `start_url`), giá trị `start_url` sẽ được dùng.

## Mô tả

Member `id` đóng vai trò là định danh duy nhất cho ứng dụng web của bạn. Nó cho phép trình duyệt phân biệt giữa các ứng dụng khác nhau:

- Khi trình duyệt gặp một manifest ứng dụng có `id` không tương ứng với một ứng dụng đã cài đặt sẵn, nó coi manifest đó là mô tả của một ứng dụng riêng biệt, ngay cả khi nó được phục vụ từ cùng một URL như một ứng dụng khác.
- Khi trình duyệt gặp một manifest ứng dụng có `id` khớp với định danh của một ứng dụng đã cài đặt sẵn, nó coi manifest mới là bản thay thế cho manifest của ứng dụng hiện có, ngay cả khi ứng dụng được phục vụ từ một URL khác với URL đã cài đặt trước đó.

> [!NOTE]
> Mặc dù `id` được xử lý như một URL, nó không trỏ tới một tài nguyên có thể truy cập, nên không bắt buộc phải nằm trong [scope](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) của ứng dụng.

`id` cũng có thể được dùng bởi các dịch vụ thu thập danh sách ứng dụng web để nhận diện duy nhất các ứng dụng.

### Ghi chú sử dụng

Một vài điểm quan trọng cần nhớ khi dùng member `id`:

- Theo thực hành được khuyến nghị, hãy dùng một dấu `/` ở đầu để chỉ rõ rằng `id` là một đường dẫn URL tương đối với root.
- Vì `id` được phân giải dựa trên origin của `start_url`, các giá trị `id` như `../foo`, `foo`, `/foo`, và `./foo` đều phân giải thành cùng một định danh so với origin. Ví dụ, nếu `start_url` là `https://example.com/app/`, tất cả các giá trị `id` này sẽ phân giải thành `https://example.com/foo/`.
- Các quy tắc mã hóa và giải mã URL tiêu chuẩn được áp dụng khi phân giải giá trị `id`.
- Fragment trong `id` bị loại bỏ trong quá trình xử lý. Ví dụ, nếu `id` được đặt thành `foo#bar`, nó sẽ được phân giải thành `foo`. Tương tự, nếu `id` không được xác định và `start_url` là `https://example.com/app/#home`, thì `id` sẽ phân giải thành `https://example.com/app/`.
- Tham số truy vấn trong `id` được giữ nguyên và được bao gồm trong định danh đã phân giải cuối cùng.

### Hiểu cách phân giải `id`

Giả sử `start_url` của ứng dụng là `https://example.com/my-app/home`. Bảng sau minh họa cách các giá trị `id` khác nhau trong manifest sẽ được phân giải:

| `id` trong manifest | `id` đã phân giải | Giải thích |
| --- | --- | --- |
| undefined | `https://example.com/my-app/home` | Mặc định là `start_url` |
| `""` | `https://example.com/my-app/home` | Chuỗi rỗng phân giải thành `start_url` |
| `/` | `https://example.com/` | URL tương đối với root |
| `foo?x=y` | `https://example.com/foo?x=y` | Đường dẫn tương đối được phân giải theo origin của `start_url` với tham số truy vấn được giữ nguyên |
| `foo#heading` | `https://example.com/foo` | Đường dẫn tương đối được phân giải theo origin của `start_url` với fragment bị xóa |
| `https://anothersite.com/foo` | `https://example.com/my-app/home` | URL khác origin không được phép, nên quay về `start_url` |
| `😀` | `https://example.com/%F0%9F%98%80` | Ký tự không phải ASCII được mã hóa trong URL |

## Ví dụ

### Tạo một phiên bản ứng dụng riêng biệt

Giả sử bạn tạo một ứng dụng web với manifest sau:

```json
{
  "name": "My Weather Application",
  "id": "https://example.com/weatherapp/v1",
  "start_url": "https://example.com/app"
}
```

Nếu sau đó bạn tạo một phiên bản khác của ứng dụng này với thay đổi đáng kể và muốn nó được coi là một ứng dụng khác, bạn có thể thêm manifest như sau:

```json
{
  "name": "My Weather Application",
  "id": "https://example.com/weatherapp/v2",
  "start_url": "https://example.com/app"
}
```

Trong trường hợp này, mặc dù cả hai tệp manifest đều được phục vụ từ cùng một URL, trình duyệt sẽ coi manifest mới là mô tả của một ứng dụng riêng biệt vì `id` khác nhau. Kết quả là, người dùng có thể cài đặt đồng thời cả hai phiên bản.

### Cập nhật một ứng dụng hiện có

Hãy xét trường hợp bạn triển khai một ứng dụng web với manifest sau:

```json
{
  "name": "My Weather Application",
  "id": "https://example.com/weatherapp/",
  "start_url": "https://example.com/old-app"
}
```

Tuy nhiên, sau đó bạn quyết định chuyển ứng dụng sang một đường dẫn khác. Khi đó, bạn sẽ cập nhật manifest như sau:

```json
{
  "name": "My Weather Application",
  "id": "https://example.com/weatherapp/",
  "start_url": "https://example.com/new-app"
}
```

Trình duyệt sẽ coi manifest mới này là một bản cập nhật cho ứng dụng hiện có vì các giá trị `id` khớp nhau. Trong trường hợp này, người dùng sẽ nhận được bản cập nhật cho ứng dụng hiện có thay vì được nhắc cài đặt một ứng dụng mới.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) manifest member
- [`start_url`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/start_url) manifest member
