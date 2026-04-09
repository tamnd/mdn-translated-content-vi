---
title: Bảo vệ chống theo dõi của Firefox
slug: Web/Privacy/Guides/Firefox_tracking_protection
page-type: guide
sidebar: privacy
---

Trang này mô tả cách tính năng bảo vệ chống theo dõi tích hợp sẵn của Firefox hoạt động và cách nó ảnh hưởng đến việc tải nội dung từ bên thứ ba.
Hiểu cách bảo vệ chống theo dõi hoạt động sẽ giúp bạn bảo đảm trang web của mình vận hành như mong đợi khi người dùng truy cập đã bật tính năng này.

## Bảo vệ chống theo dõi là gì?

Firefox Desktop và Firefox dành cho Android đều có sẵn tính năng bảo vệ chống theo dõi tích hợp. Trong các cửa sổ Duyệt web riêng tư (các tab riêng tư trong Firefox dành cho Android), Firefox sẽ chặn nội dung được tải từ các miền theo dõi người dùng qua nhiều trang web (tức là thông qua [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies)).

Nếu nội dung bị chặn là một phần của bố cục trang, người dùng có thể nhận thấy các vấn đề về bố cục do Firefox chặn các lượt tải này. Đôi khi người dùng sẽ không nhận thấy gì cả, nếu lưới trang hoạt động theo cách mà các thành phần khác tự dịch chuyển để lấp các khoảng trống do phần tử bị chặn để lại.

Khi Firefox chặn nội dung, nó sẽ ghi một thông báo vào Web Console như sau:

```plain
The resource at "http://some/url" was blocked because tracking protection is enabled.
```

Lưu ý rằng với Firefox dành cho Android, bạn có thể xem đầu ra của console bằng trình gỡ lỗi từ xa.

![Thông tin trang hiển thị nội dung có thể đã bị chặn.](blocked_content.png)

Bấm vào biểu tượng ⓘ trên thanh địa chỉ để xem thông tin về trang hiện đang được tải. Hộp thoại bật lên xuất hiện sẽ thông báo cho bạn khi nội dung đã bị chặn. Bạn cũng có thể tắt hoàn toàn tính năng bảo vệ chống theo dõi nếu muốn bằng cách truy cập cài đặt theo dõi.

Nếu có cookie theo dõi, bạn có thể xem danh sách bằng cách bấm vào "Blocking Tracking Cookies" trong hình ở trên để mở hộp thoại sau:

![Thông tin trang hiển thị cookie và dữ liệu trang web.](tracking_cookies.png)

Bạn có thể bấm "Manage Content Blocking" để thay đổi cài đặt chặn:

![Có 3 mức chặn nội dung: standard, strict, hoặc custom; có thể đặt luôn bật hoặc chỉ bật khi Firefox được cấu hình chặn các trình theo dõi đã biết.](content_blocking.png)

## Firefox chọn chặn nội dung như thế nào?

Nội dung được chặn dựa trên miền mà nó sẽ được tải từ đó.

Firefox đi kèm một danh sách các trang web đã được xác định là thực hiện theo dõi người dùng giữa các trang web. Khi tính năng bảo vệ chống theo dõi được bật, Firefox sẽ chặn nội dung từ các trang web nằm trong danh sách đó.

Các trang web theo dõi người dùng thường là các trang quảng cáo và phân tích của bên thứ ba.

## Điều này có nghĩa gì đối với trang web của bạn?

Trước hết, điều đó có nghĩa là khi tính năng bảo vệ chống theo dõi được bật:

- Nội dung được phục vụ từ các trình theo dõi bên thứ ba sẽ không hiển thị với người dùng.
- Trang web của bạn sẽ không thể dùng các dịch vụ quảng cáo hoặc phân tích bên thứ ba có hành vi theo dõi.

Ở mức tinh tế hơn, nếu những phần khác của trang web phụ thuộc vào việc các trình theo dõi được tải, thì những phần này cũng sẽ bị hỏng khi bảo vệ chống theo dõi được bật. Ví dụ, nếu trang web của bạn có một callback chạy khi nội dung từ một trang theo dõi được tải, thì callback đó sẽ không chạy.

Ví dụ, bạn không nên dùng Google Analytics theo cách sau:

```js example-bad
function trackLink(url, event) {
  event.preventDefault();
  ga("send", "event", "outbound", "click", url, {
    transport: "beacon",
    hitCallback() {
      document.location = url;
    },
  });
}

document.querySelectorAll("a").forEach((link) => {
  link.addEventListener("click", (event) => {
    trackLink(link.href, event);
  });
});
```

Thay vào đó, bạn nên xử lý trường hợp Google Analytics không có sẵn bằng cách kiểm tra xem đối tượng `ga` đã được khởi tạo hay chưa:

```js example-good
function trackLink(url, event) {
  event.preventDefault();
  if (window.ga && ga.loaded) {
    ga("send", "event", "outbound", "click", url, {
      transport: "beacon",
      hitCallback() {
        document.location = url;
      },
    });
  } else {
    document.location = url;
  }
}

document.querySelectorAll("a").forEach((link) => {
  link.addEventListener("click", (event) => {
    trackLink(link.href, event);
  });
});
```

Bạn có thể xem thêm thông tin về kỹ thuật này tại [Google Analytics, Privacy, and Event Tracking](https://hacks.mozilla.org/2016/01/google-analytics-privacy-and-event-tracking/).

> [!NOTE]
> Dù sao thì việc phụ thuộc vào một bên thứ ba theo cách này cũng không phải là thực hành tốt, vì trang web của bạn có thể bị hỏng nếu bên thứ ba chậm hoặc không khả dụng, hoặc nếu trình theo dõi bị một tiện ích mở rộng chặn.
