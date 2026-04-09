---
title: scope
slug: Web/Progressive_web_apps/Manifest/Reference/scope
page-type: web-manifest-member
browser-compat: manifests.webapp.scope
sidebar: pwasidebar
---

Member manifest `scope` được dùng để chỉ định đường dẫn URL cấp cao nhất chứa các trang và thư mục con của ứng dụng web của bạn.
Khi người dùng cài đặt và sử dụng ứng dụng web, các trang _trong scope_ cung cấp giao diện giống ứng dụng.
Khi người dùng điều hướng tới các trang nằm ngoài scope của ứng dụng, họ vẫn nhìn thấy giao diện giống ứng dụng, nhưng trình duyệt sẽ hiển thị các phần tử giao diện như thanh URL để cho biết ngữ cảnh đã thay đổi.

## Cú pháp

```json-nolint
/* URL tuyệt đối */
"scope": "https://example.com/myapp/"

/* URL tương đối */
"scope": "/myapp/"

/* Scope giới hạn ở một thư mục cụ thể */
"scope": "/myapp/dashboard/"
```

### Giá trị

- `scope`
  - : Một chuỗi đại diện cho một URL.
    URL có thể là tuyệt đối hoặc tương đối.
    Nếu giá trị là tương đối, nó được phân giải dựa trên URL của tệp manifest.

    Nếu `scope` không được chỉ định trong manifest hoặc giá trị không hợp lệ (tức là không phải chuỗi, không phải URL hợp lệ, hoặc `start_url` không nằm trong `scope` đã chỉ định), scope hiệu lực sẽ được đặt thành giá trị `start_url` sau khi bỏ tên tệp, query, và fragment.

## Mô tả

Member `scope` xác định các URL thuộc trải nghiệm ứng dụng đã cài đặt của bạn.
Trình duyệt dùng `scope` để xác định liệu một trang có nằm trong {{Glossary("Application_context", "application context")}} của ứng dụng web của bạn hay không.

### Hành vi trong scope và ngoài scope

Một URL được coi là "trong scope" nếu đường dẫn của nó bắt đầu bằng đường dẫn URL được định nghĩa trong `scope`.
Ví dụ, nếu `scope` được đặt thành `/app/`, thì các URL `/app/`, `/app/page.html`, và `/app/dashboard/index.html` đều được coi là trong scope, trong khi `/` hoặc `/page.html` thì không.

Khi người dùng mở ứng dụng web đã cài, họ trải nghiệm một giao diện giống ứng dụng.
Đối với các trang trong scope, trình duyệt duy trì application context và giữ nguyên trải nghiệm giống ứng dụng.
Khi người dùng điều hướng tới các trang ngoài scope của ứng dụng, họ vẫn nhìn chung trải nghiệm giao diện giống ứng dụng; tuy nhiên, trên các trang này, trình duyệt sẽ hiển thị thêm các phần tử giao diện như thanh URL.
Điều này giúp người dùng hiểu rằng họ đang xem các trang nằm ngoài scope đã định nghĩa của ứng dụng.

> [!NOTE]
> Member `scope` không ngăn người dùng điều hướng tới các trang ứng dụng nằm ngoài phạm vi đã định nghĩa.
> Các điều hướng ngoài scope không bị trình duyệt chặn và có thể được mở trong một top-level browsing context mới.

Hãy xét một ứng dụng web khám phá đường mòn đi bộ với cấu trúc thư mục sau:

```plain
web-app/
├── manifest.json
├── trails/
│   ├── index.html
│   ├── trail-list.html
│   ├── settings/
│   │   └── index.html
│   └── saratoga-gap-trail.html
├── blog/
│   └── index.html
```

Với scope đặt thành `/trails/`:

- Khi xem các trang và thư mục con bên dưới `/trails/` (như `trail-list.html` và `/trails/settings/index.html`), người dùng sẽ có trải nghiệm giao diện giống ứng dụng mà không có điều khiển trình duyệt (hình bên trái).
- Khi điều hướng tới các trang trong các thư mục con như `/blog/`, nằm ngoài scope của ứng dụng, giao diện giống ứng dụng vẫn còn nhưng người dùng sẽ thấy địa chỉ website và các điều khiển trình duyệt khác (hình bên phải).

| Trang trong scope | Trang ngoài scope |
| --- | --- |
| ![Trang danh sách đường mòn hiển thị giao diện giống ứng dụng không có điều khiển trình duyệt](trail-list.png) | ![Trang blog hiển thị địa chỉ website và điều khiển trình duyệt trong khi vẫn giữ giao diện giống ứng dụng](blog.png) |

### Ảnh hưởng của scope lên các trang được liên kết sâu

Các ứng dụng khác có thể liên kết sâu trực tiếp tới các trang cụ thể của ứng dụng web của bạn.
Member `scope` ảnh hưởng đến cách các trang được liên kết sâu này được hiển thị, nhưng không bắt buộc để liên kết sâu hoạt động.

Hãy xét ví dụ trước về ứng dụng web khám phá đường mòn đi bộ, với `scope` đặt thành `/trails/`:

- Nếu một liên kết tới `https://trailnav.app/trails/saratoga-gap-trail.html` được chia sẻ trên mạng xã hội, người dùng đã cài Trail Navigator sẽ xem trang này trong giao diện của ứng dụng mà không có điều khiển trình duyệt.
- Nếu một liên kết tới `https://trailnav.app/blog/trail-safety.html` được chia sẻ, người dùng này sẽ xem trang blog trong giao diện giống ứng dụng nhưng với địa chỉ website và các điều khiển trình duyệt hiển thị, vì nó nằm ngoài scope đã định nghĩa của ứng dụng.

Hành vi này giúp người dùng hiểu liệu họ đang xem các trang trong hay ngoài scope của ứng dụng, ngay cả khi truy cập qua các liên kết bên ngoài.

### Hành vi scope dự phòng

`scope` là không hợp lệ nếu `start_url` không phải là tập con của URL `scope`. Ví dụ:

- **Hợp lệ**: `scope` là `/app/`, và `start_url` là `/app/home.html`.
- **Không hợp lệ**: `scope` là `/app/`, và `start_url` là `/index.html`.

Nếu `scope` bị thiếu hoặc không hợp lệ, nó sẽ mặc định thành giá trị `start_url` sau khi bỏ tên tệp, query, và fragment.
Lưu ý rằng nếu `start_url` cũng không được xác định (hoặc không hợp lệ) thì nó sẽ mặc định là trang liên kết tới manifest.
Điều này bảo đảm rằng theo mặc định scope sẽ bắt đầu từ trang đã kích hoạt cài đặt.

Ví dụ:

- Nếu `start_url` là `https://example.com/app/index.html?user=123#home`, scope sẽ là `https://example.com/app/`.
- Nếu `start_url` là `/pages/welcome.html`, scope sẽ là `/pages/` trên cùng origin.
- Nếu `start_url` là `/pages/` (dấu gạch chéo cuối là quan trọng), scope sẽ là `/pages/`.

Nếu bạn dựa vào hành vi dự phòng của `scope`, hãy bảo đảm rằng URL của tất cả các trang trong ứng dụng đều bắt đầu bằng đường dẫn cha của `start_url`.
Để tránh các vấn đề về xác định scope theo cách này, bạn nên chỉ định rõ `scope` trong manifest của mình.

### Cơ chế khớp scope

So khớp chuỗi cho URL scope dùng một phép so khớp tiền tố đơn giản, không phải cấu trúc đường dẫn.
Ví dụ, nếu `scope` được đặt là `/prefix`, nó sẽ khớp với các URL bắt đầu bằng `/prefix`, bao gồm `/prefix-of/index.html` và `/prefix/index.html`. Lưu ý rằng `/prefix-of/index.html` vẫn khớp dù `prefix-of` không khớp chính xác với scope `/prefix`.

Vì lý do này, nên định nghĩa scope kết thúc bằng một `/`.
Đặt `scope` là `/prefix/` sẽ bảo đảm nó chỉ khớp với các trang trong thư mục `/prefix/`, tránh khớp ngoài ý muốn.

## Ví dụ

### Chỉ định URL tuyệt đối cho scope

Giả sử tệp manifest của ứng dụng web của bạn được liên kết từ `https://hikingapp.com/index.html`, và bạn muốn scope bao gồm tất cả các thư mục con. Bạn có thể chỉ định scope này bằng một URL tuyệt đối cùng origin với URL của tệp manifest, như bên dưới. Điều này bảo đảm rằng các trang như `https://hikingapp.com/store` và `https://hikingapp.com/company` là một phần của ứng dụng web của bạn.

```json
{
  "scope": "https://hikingapp.com/"
}
```

### Chỉ định URL tương đối cho scope

Nếu URL của tệp manifest là `https://hikingapp.com/resources/manifest.json`, và bạn muốn scope là `https://hikingapp.com/app/`, bạn có thể định nghĩa nó như một URL tương đối:

```json
{
  "scope": "../app/"
}
```

### Định nghĩa một ứng dụng web cho một phần cụ thể của site

Nếu bạn có một website với nhiều phần, nhưng bạn muốn ứng dụng web tập trung vào một phần cụ thể, bạn có thể định nghĩa `scope` như sau:

```json
{
  "name": "My Hiking Web App",
  "start_url": "https://hikingapp.com/store/",
  "scope": "https://hikingapp.com/store/"
}
```

Với thiết lập này, các trang như `https://hikingapp.com/store/products` thuộc về ứng dụng web của bạn, nhưng `https://hikingapp.com/company/` nằm ngoài scope của ứng dụng. Với các URL ngoài scope, trình duyệt có thể hiển thị các phần tử giao diện khác nhau để cho người dùng biết rằng họ đã rời khỏi scope của ứng dụng.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`start_url`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/start_url) manifest member
- {{Glossary("Application_context", "Application context")}}
