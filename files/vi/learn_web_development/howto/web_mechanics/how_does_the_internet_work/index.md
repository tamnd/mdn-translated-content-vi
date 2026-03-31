---
title: How does the Internet work?
slug: Learn_web_development/Howto/Web_mechanics/How_does_the_Internet_work
page-type: learn-faq
sidebar: learn-how-to
---

Bài viết này thảo luận về Internet là gì và nó hoạt động như thế nào.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Không có, nhưng chúng tôi khuyến khích bạn đọc
        <a href="/en-US/docs/Learn_web_development/Howto/Design_and_accessibility/Thinking_before_coding"
          >Bài viết về thiết lập mục tiêu dự án</a
        >
        trước
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Bạn sẽ tìm hiểu những kiến thức cơ bản về cơ sở hạ tầng kỹ thuật của Web và
        sự khác biệt giữa Internet và Web.
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt

**Internet** là nền tảng của Web, là cơ sở hạ tầng kỹ thuật giúp Web trở thành hiện thực. Ở mức cơ bản nhất, Internet là một mạng lưới lớn gồm các máy tính liên lạc với nhau.

[Lịch sử của Internet có phần mơ hồ](https://en.wikipedia.org/wiki/Internet#History). Nó bắt đầu vào những năm 1960 như một dự án nghiên cứu được quân đội Mỹ tài trợ, sau đó phát triển thành cơ sở hạ tầng công cộng vào những năm 1980 với sự hỗ trợ của nhiều trường đại học công lập và công ty tư nhân. Các công nghệ hỗ trợ Internet đã phát triển theo thời gian, nhưng cách nó hoạt động không thay đổi nhiều: Internet là cách kết nối các máy tính lại với nhau và đảm bảo rằng, dù có chuyện gì xảy ra, chúng vẫn tìm được cách duy trì kết nối.

## Video về Internet

- [Internet hoạt động trong 5 phút](https://www.youtube.com/watch?v=7_LPdttKXPc): Video 5 phút để hiểu những điều rất cơ bản về Internet của Aaron Titus.
- [Internet hoạt động như thế nào?](https://www.youtube.com/watch?v=x3c1ih2NJEg) Video 9 phút chi tiết với hình ảnh trực quan đẹp.

## Tìm hiểu sâu hơn

### Một mạng đơn giản

Khi hai máy tính cần giao tiếp, bạn phải kết nối chúng, hoặc bằng cách vật lý (thường với [cáp Ethernet](https://en.wikipedia.org/wiki/Ethernet_crossover_cable)) hoặc không dây (ví dụ với hệ thống [Wi-Fi](https://en.wikipedia.org/wiki/Wi-Fi) hoặc [Bluetooth](https://en.wikipedia.org/wiki/Bluetooth)). Tất cả các máy tính hiện đại đều có thể duy trì bất kỳ kết nối nào trong số đó.

> [!NOTE]
> Trong phần còn lại của bài viết này, chúng ta sẽ chỉ nói về cáp vật lý, nhưng mạng không dây hoạt động theo cùng một cách.

![Hai máy tính được kết nối với nhau](internet-schema-1.png)

Một mạng như vậy không bị giới hạn ở hai máy tính. Bạn có thể kết nối bao nhiêu máy tính tùy muốn. Nhưng nó nhanh chóng trở nên phức tạp. Nếu bạn đang cố gắng kết nối, chẳng hạn, mười máy tính, bạn cần 45 cáp, với chín đầu cắm cho mỗi máy tính!

![Mười máy tính tất cả cùng nhau](internet-schema-2.png)

Để giải quyết vấn đề này, mỗi máy tính trong mạng được kết nối với một máy tính nhỏ đặc biệt gọi là _switch mạng_ (hay ngắn gọn là _switch_). Switch này chỉ có một nhiệm vụ: giống như một người phát tín hiệu ở ga xe lửa, nó đảm bảo rằng các tin nhắn được gửi từ một máy tính nhất định chỉ đến đúng máy tính đích. Để gửi tin nhắn đến máy tính B, máy tính A gửi tin nhắn đến switch, switch đó sẽ chuyển tiếp tin nhắn đến máy tính B — máy tính B không nhận các tin nhắn dành cho máy tính khác, và không có tin nhắn nào dành cho máy tính B đến được các máy tính khác trong mạng cục bộ.

Khi chúng ta thêm switch vào hệ thống, mạng của 10 máy tính chỉ cần 10 cáp: một đầu cắm cho mỗi máy tính và một switch với 10 đầu cắm.

![Mười máy tính với một switch](internet-schema-3.png)

### Mạng của các mạng

Cho đến nay vẫn ổn. Nhưng còn việc kết nối hàng trăm, hàng nghìn, hàng tỷ máy tính thì sao? Tất nhiên một switch đơn không thể mở rộng đến mức đó, nhưng, nếu bạn đọc kỹ, chúng ta đã nói rằng switch là một máy tính giống như bất kỳ máy tính nào khác, vậy điều gì ngăn chúng ta kết nối hai switch với nhau? Không có gì, vậy hãy làm điều đó.

![Hai switch được kết nối với nhau](internet-schema-4.png)

Bạn có thể hình dung rằng chúng ta có thể kết nối các switch với nhau vô hạn, để tạo thành một mạng như thế này:

![Các switch được kết nối với các switch](internet-schema-5.png)

Trên thực tế, điều này dẫn đến nhiều vấn đề kỹ thuật. Switch càng nhiều mà gói tin phải đi qua, thì càng mất thời gian để đến đích. Và bạn không thể chỉ có một cây switch, vì khi đó một switch hỏng có thể ngắt kết nối một phần lớn các thiết bị. Để giải quyết vấn đề này, chúng ta giữ mỗi mạng cục bộ nhỏ nhất có thể, và kết nối các mạng cục bộ này bằng một thiết bị riêng gọi là _router_ (bộ định tuyến). Router là một máy tính biết cách chuyển tiếp tin nhắn giữa các mạng. Router giống như bưu điện: khi gói tin đến, nó đọc địa chỉ người nhận và chuyển tiếp gói tin đến đúng người nhận, không đi qua các lớp chuyển tiếp.

Một mạng như vậy rất gần với những gì chúng ta gọi là Internet. Chúng ta chỉ cần phương tiện vật lý (cáp) để kết nối tất cả các router này. May mắn thay, cơ sở hạ tầng như vậy đã tồn tại trước Internet, đó là mạng điện thoại. Để kết nối mạng của chúng ta với cơ sở hạ tầng điện thoại, chúng ta cần một thiết bị đặc biệt gọi là _modem_. _Modem_ này chuyển đổi thông tin từ mạng của chúng ta thành thông tin có thể xử lý được bởi cơ sở hạ tầng điện thoại và ngược lại.

![Một router được kết nối với một modem](internet-schema-6.png)

Lưu ý rằng router thương mại trong nhà bạn có thể là sự kết hợp của switch, router và modem trong một thiết bị.

Vậy chúng ta đã kết nối với cơ sở hạ tầng điện thoại. Bước tiếp theo là gửi tin nhắn từ mạng của chúng ta đến mạng chúng ta muốn đến. Để làm điều đó, chúng ta sẽ kết nối mạng của mình với Nhà cung cấp Dịch vụ Internet (ISP). ISP là công ty quản lý một số _router_ đặc biệt được kết nối với nhau và cũng có thể truy cập các router của các ISP khác. Vì vậy, tin nhắn từ mạng của chúng ta được truyền qua mạng các ISP đến mạng đích. Internet bao gồm toàn bộ cơ sở hạ tầng mạng này.

![Toàn bộ ngăn xếp Internet](internet-schema-7.png)

### Tìm máy tính

Nếu bạn muốn gửi tin nhắn đến một máy tính, bạn phải chỉ định đó là máy tính nào. Do đó, bất kỳ máy tính nào được kết nối với mạng đều có một địa chỉ duy nhất xác định nó, gọi là "địa chỉ IP" (trong đó IP là viết tắt của _Internet Protocol_ — Giao thức Internet). Đây là địa chỉ gồm một chuỗi bốn số được phân tách bởi dấu chấm, ví dụ: `192.0.2.172`.

Điều đó hoàn toàn ổn cho máy tính, nhưng chúng ta con người gặp khó khăn trong việc ghi nhớ loại địa chỉ đó. Để mọi thứ dễ dàng hơn, chúng ta có thể đặt bí danh cho địa chỉ IP bằng một tên dễ đọc gọi là _tên miền_. Ví dụ (tại thời điểm viết; địa chỉ IP có thể thay đổi) `google.com` là tên miền được sử dụng trên địa chỉ IP `142.250.190.78`. Vì vậy, sử dụng tên miền là cách dễ nhất để chúng ta tiếp cận một máy tính qua Internet.

![Hiển thị cách tên miền có thể là bí danh cho địa chỉ IP](dns-ip.png)

### Internet và web

Như bạn có thể nhận thấy, khi chúng ta duyệt web bằng trình duyệt, chúng ta thường sử dụng tên miền để đến một website. Điều đó có nghĩa là Internet và Web là cùng một thứ không? Không đơn giản như vậy. Như chúng ta đã thấy, Internet là một cơ sở hạ tầng kỹ thuật cho phép hàng tỷ máy tính được kết nối với nhau. Trong số những máy tính đó, một số máy tính (gọi là _máy chủ Web_) có thể gửi tin nhắn mà trình duyệt web có thể hiểu được. _Internet_ là cơ sở hạ tầng, trong khi _Web_ là một dịch vụ được xây dựng trên cơ sở hạ tầng đó. Đáng chú ý là có nhiều dịch vụ khác được xây dựng trên Internet, như email và {{Glossary("IRC")}}.

### Mạng nội bộ và Mạng ngoại bộ

Mạng nội bộ (Intranet) là các mạng _riêng tư_ bị giới hạn trong phạm vi thành viên của một tổ chức cụ thể.
Chúng thường được sử dụng để cung cấp cổng thông tin cho các thành viên để truy cập an toàn vào tài nguyên chia sẻ, cộng tác và giao tiếp.
Ví dụ, mạng nội bộ của một tổ chức có thể lưu trữ các trang web để chia sẻ thông tin phòng ban hoặc nhóm, ổ đĩa chia sẻ để quản lý các tài liệu và tệp quan trọng,
cổng thông tin để thực hiện các tác vụ quản trị kinh doanh, và các công cụ cộng tác như wiki, bảng thảo luận và hệ thống nhắn tin.

Mạng ngoại bộ (Extranet) rất giống với Mạng nội bộ, ngoại trừ chúng mở tất cả hoặc một phần mạng riêng tư để cho phép chia sẻ và cộng tác với các tổ chức khác.
Chúng thường được sử dụng để chia sẻ thông tin một cách an toàn với khách hàng và các bên liên quan làm việc chặt chẽ với doanh nghiệp.
Thường thì các chức năng của chúng tương tự như những gì mạng nội bộ cung cấp: chia sẻ thông tin và tệp, công cụ cộng tác, bảng thảo luận, v.v.

Cả mạng nội bộ và mạng ngoại bộ đều chạy trên cùng loại cơ sở hạ tầng như Internet, và sử dụng cùng các giao thức.
Do đó, chúng có thể được truy cập bởi các thành viên được ủy quyền từ các địa điểm vật lý khác nhau.

![Biểu diễn đồ họa về cách Extranet và Intranet hoạt động](internet-schema-8.png)

## Các bước tiếp theo

- [Cách Web hoạt động](/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_the_web_works)
- [Hiểu sự khác biệt giữa trang web, website, máy chủ web và công cụ tìm kiếm](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Browsing_the_web)
- [Hiểu về tên miền](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_domain_name)
