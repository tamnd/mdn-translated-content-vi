---
title: Định dạng ngày bằng luxon
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Date_formatting_using_moment
page-type: learn-module-chapter
sidebar: learnsidebar
---

Cách render ngày mặc định từ mô hình của chúng ta rất xấu: _Mon Apr 10 2020 15:49:58 GMT+1100 (AUS Eastern Daylight Time)_. Trong phần này, chúng tôi sẽ chỉ cách bạn có thể cập nhật trang _BookInstance List_ từ phần trước để trình bày trường `due_date` theo định dạng thân thiện hơn: Apr 10th, 2023.

Cách tiếp cận chúng tôi sẽ sử dụng là tạo một thuộc tính ảo trong mô hình `BookInstance` trả về ngày được định dạng. Chúng tôi sẽ thực hiện định dạng thực tế bằng [luxon](https://www.npmjs.com/package/luxon), một thư viện mạnh mẽ, hiện đại và thân thiện để phân tích, xác thực, thao tác, định dạng và bản địa hóa ngày tháng.

> [!NOTE]
> Có thể sử dụng _luxon_ để định dạng chuỗi trực tiếp trong các mẫu Pug của chúng tôi, hoặc chúng tôi có thể định dạng chuỗi ở nhiều nơi khác. Sử dụng thuộc tính ảo cho phép chúng tôi lấy ngày được định dạng theo cách hoàn toàn giống như cách chúng tôi lấy `due_date` hiện tại.

## Cài đặt luxon

Nhập lệnh sau vào gốc của dự án:

```bash
npm install luxon
```

## Tạo thuộc tính ảo

1. Mở **./models/bookinstance.js**.
2. Ở đầu trang, import _luxon_.

   ```js
   const { DateTime } = require("luxon");
   ```

Thêm thuộc tính ảo `due_back_formatted` ngay sau thuộc tính URL.

```js
BookInstanceSchema.virtual("due_back_formatted").get(function () {
  return DateTime.fromJSDate(this.due_back).toLocaleString(DateTime.DATE_MED);
});
```

> [!NOTE]
> Luxon có thể import chuỗi ở nhiều định dạng và xuất ra cả định dạng được xác định trước và định dạng tự do. Trong trường hợp này, chúng tôi sử dụng `fromJSDate()` để import một chuỗi ngày JavaScript và `toLocaleString()` để xuất ngày theo định dạng `DATE_MED` bằng tiếng Anh: Apr 10th, 2023.
> Để biết thông tin về các định dạng khác và quốc tế hóa chuỗi ngày, hãy xem tài liệu Luxon về [định dạng](https://github.com/moment/luxon/blob/master/docs/formatting.md#formatting).

## Cập nhật view

Mở **/views/bookinstance_list.pug** và thay thế `due_back` bằng `due_back_formatted`.

```pug
      if val.status != 'Available'
        //span  (Due: #{val.due_back} )
        span  (Due: #{val.due_back_formatted} )
```

Đó là tất cả. Nếu bạn vào _All book-instances_ trong thanh bên, bây giờ bạn sẽ thấy tất cả ngày đến hạn đều hấp dẫn hơn nhiều!

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).
- Tiến tới bài viết con tiếp theo của phần 5: [Trang danh sách tác giả và thử thách trang danh sách thể loại](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Author_list_page).
