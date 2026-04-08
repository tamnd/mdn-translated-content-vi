---
title: Contribute a recipe
slug: Web/CSS/How_to/Layout_cookbook/Contribute_a_recipe
page-type: guide
sidebar: cssref
---

Nếu bạn muốn đóng góp một ví dụ cho Layout Cookbook, trang này giải thích các bước cần thực hiện để xuất bản ví dụ của bạn.

## Điều gì tạo nên một công thức tốt?

**Phiên bản đơn giản nhất có thể của bất kỳ mẫu thiết kế web hữu ích nào**. Mỗi dòng CSS bạn đưa vào phải được đưa vào để giúp minh họa mẫu, vì vậy hãy bỏ qua bất cứ thứ gì chỉ để làm cho ví dụ trông đẹp hơn. Ý tưởng là ai đó có thể lấy mẫu và sử dụng nó trong một trang web với style của riêng họ.

Một công thức bao gồm:

- Một ví dụ trực tiếp, được lưu trữ trong [CSS Examples GitHub repo](https://github.com/mdn/css-examples).
- Một phiên bản có thể tải xuống của ví dụ đó, cũng được lưu trữ trong CSS Examples repo.
- Một trang trong phần [CSS layout cookbook](/en-US/docs/Web/CSS/How_to/Layout_cookbook) của trang web, phải bao gồm các thành phần sau:
  1. Giới thiệu
  2. Yêu cầu
  3. Công thức
  4. Các quyết định
  5. Các phương án dự phòng hoặc phương pháp thay thế hữu ích (khi liên quan)
  6. Vấn đề về khả năng tiếp cận
  7. Tương thích trình duyệt (chỉ cho các thuộc tính CSS chưa được hỗ trợ đầy đủ)
  8. Tài nguyên bổ sung

## Các bước để xuất bản một công thức

Để tạo một công thức và thêm vào CSS layout cookbook, hãy làm theo các bước sau:

- [Điều gì tạo nên một công thức tốt?](#what_makes_a_good_recipe)
- [Các bước để xuất bản một công thức](#steps_to_publish_a_recipe)
  - [1. Xây dựng một mẫu](#1._build_a_pattern)
  - [2. Tạo một ví dụ trực tiếp](#2._create_a_live_example)
  - [3. Tạo phiên bản có thể tải xuống](#3._create_a_downloadable_version)
  - [4. Mở pull request với ví dụ của bạn](#4._open_a_pull_request_with_your_example)
  - [5. Tạo trang của bạn](#5._create_your_page)

### 1. Xây dựng một mẫu

Trước khi chuyển ví dụ của bạn thành một công thức, hãy bắt đầu bằng cách tạo mẫu của bạn dưới dạng một trang HTML cơ bản. Hãy nghĩ về những gì bạn đang cố gắng minh họa và giữ cho nó càng đơn giản càng tốt. Sử dụng các từ mô tả như "container" hoặc "item" nếu thêm tên class.

Đảm bảo rằng bạn đã kiểm tra HTML và CSS trên nhiều trình duyệt, kích thước viewport và thiết bị. Ngoài ra hãy đảm bảo rằng mọi CSS styling đều tuân theo các hướng dẫn về khả năng tiếp cận. Mặc dù không sao khi sử dụng các thuộc tính CSS có hỗ trợ hạn chế, nhưng hãy đảm bảo bao gồm thông tin hỗ trợ trình duyệt khi tạo trang, đặc biệt là trong phần tương thích trình duyệt. Trong một số trường hợp, việc tạo phiên bản thứ hai của ví dụ với hỗ trợ dự phòng có thể hữu ích.

### 2. Tạo một ví dụ trực tiếp

Các ví dụ trực tiếp trên các trang cookbook, chẳng hạn như cho [centering an element](/en-US/docs/Web/CSS/How_to/Layout_cookbook/Center_an_element), và các nơi khác trên MDN cho phép người đọc chơi với code và thay đổi các phần liên quan mà không bị choáng ngợp bởi tất cả code. Công thức của bạn sẽ được minh họa bằng một hoặc nhiều ví dụ.

Fork [CSS Examples repo](https://github.com/mdn/css-examples) và sau đó xem thư mục `css-cookbook`. Có một file [cookbook-template.html](https://github.com/mdn/css-examples/blob/main/css-cookbook/cookbook-template.html). Sao chép file này và sử dụng nó làm điểm khởi đầu. Lưu file này vào thư mục `css-cookbook` với tên phù hợp với mẫu của bạn. Template chứa các chú thích để hướng dẫn bạn thêm các phần khác nhau vào đúng vị trí.

Các phần quan trọng của template này như sau:

- Có một stylesheet cho các bảng điều khiển chỉnh sửa với một số styling body cơ bản và một file JavaScript cho chức năng chỉnh sửa. Để nguyên các file này.

- `<head>` chứa hai khối style. Khối style đầu tiên dành cho các phần tử mà người đọc không cần thay đổi để chơi với ví dụ. Khối style thứ hai chứa các mục mà người đọc có thể muốn thay đổi. Thông thường chúng ta thêm tất cả CSS của mình vào khối đầu tiên, sau đó chọn các quy tắc để chuyển sang khối thứ hai. Các quy tắc trong khối thứ hai phải là những quy tắc cơ bản cho mẫu, có thể là những quy tắc mà người đọc có thể thay đổi giá trị CSS và xem mẫu cập nhật.

- Bạn cần thêm HTML cho thành phần của mình hai lần: đầu tiên bên trong phần có class `preview`, và sau đó bên trong `<textarea>` có class `playable-html`.

- CSS có thể chỉnh sửa từ khối `<head>` thứ hai cũng phải được sao chép vào phần `playable-css`.

Một ví dụ hoạt động là [center.html](https://github.com/mdn/css-examples/blob/main/css-cookbook/center.html), được nhúng trên trang [Center an element](/en-US/docs/Web/CSS/How_to/Layout_cookbook/Center_an_element). Bạn có thể sử dụng điều này để xem cách thêm các phần khác nhau một cách chính xác.

Nếu bạn đã fork repo và có các file CSS và JavaScript của chúng tôi với ví dụ của bạn, việc mở ví dụ trực tiếp của bạn trong trình duyệt sẽ hiển thị mọi thứ hoạt động chính xác như nó sẽ xuất hiện trên trang MDN.

#### Mẹo hữu ích

- Không thụt lề CSS và HTML bên trong các text area; thay vào đó, căn chỉnh code với đầu dòng. Điều này sẽ trông đẹp hơn khi được render.
- Nếu cần hình ảnh nào, hãy đặt chúng vào thư mục có các ví dụ. Bạn được chào đón sử dụng bất kỳ hình ảnh nào đã có sẵn.
- Bạn có thể điều chỉnh chiều cao của các text area bằng cách thay đổi chiều cao trong các inline style.

### 3. Tạo phiên bản có thể tải xuống

Vì các ví dụ bao gồm tất cả code ví dụ trực tiếp, chúng tôi muốn cung cấp cho người đọc chỉ code họ cần cho ví dụ của mình, bỏ qua các mục không cần thiết. Tạo một bản sao của ví dụ trực tiếp và thêm `--download` vào tên của nó. Ví dụ: phiên bản tải xuống của `center.html` là `center--download.html`. File này sẽ tương tự như ví dụ ban đầu của bạn. Nó phải là một phiên bản cơ bản của mẫu dưới dạng một trang HTML đơn.

Có thể hữu ích khi bao gồm các quy tắc CSS body từ stylesheet được bao gồm của chúng tôi. Hãy xem [`cookbook-template--download.html`](https://github.com/mdn/css-examples/blob/main/css-cookbook/cookbook-template--download.html) làm hướng dẫn; các quy tắc này được cung cấp như một điểm khởi đầu.

### 4. Mở pull request với ví dụ của bạn

Mở pull request (PR) trên [CSS Examples repo](https://github.com/mdn/css-examples/pulls). Điều này cho phép chúng tôi giúp bạn với bất kỳ thay đổi nào đối với ví dụ có thể cần thiết trước khi bạn tạo trang. Ngoài ra, ví dụ sẽ cần phải trực tiếp để được đưa vào. Đây là lý do tại sao việc đầu tiên tạo các ví dụ code rồi sau đó là hướng dẫn giải thích là hợp lý. Trong PR của bạn, hãy giải thích mẫu và những gì bạn đang minh họa. Xem [hướng dẫn mở pull request](/en-US/docs/MDN/Community/Pull_requests#open_a_pull_request) của chúng tôi.

### 5. Tạo trang của bạn

Sau khi PR ví dụ của bạn được merge, hãy mở pull request để tạo một trang mới trong [thư mục Layout Cookbook](https://github.com/mdn/content/tree/main/files/en-us/web/css/how_to/layout_cookbook).
Sử dụng [template cho các trang Cookbook](https://github.com/mdn/content/blob/main/files/en-us/web/css/how_to/layout_cookbook/contribute_a_recipe/cookbook_template/index.md?plain=1).
Template giải thích các yêu cầu của từng phần, và bạn có thể tham khảo các ví dụ cookbook khác để được trợ giúp thêm.

Hãy nhớ thêm liên kết đến công thức mới của bạn trên trang chính [Layout cookbook](/en-US/docs/Web/CSS/How_to/Layout_cookbook).

Nếu bạn có bất kỳ câu hỏi nào hoặc muốn ai đó xem trang của bạn, hãy liên hệ qua bất kỳ [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) nào của chúng tôi.

## Xem thêm

- [Cookbook page template](/en-US/docs/Web/CSS/How_to/Layout_cookbook/Contribute_a_recipe/Cookbook_template)
- [CSS Examples repo](https://github.com/mdn/css-examples)
