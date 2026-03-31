---
title: What is a Domain Name?
slug: Learn_web_development/Howto/Web_mechanics/What_is_a_domain_name
page-type: learn-faq
sidebar: learn-how-to
---

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Trước tiên bạn cần biết
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/How_does_the_Internet_work"
          >Internet hoạt động như thế nào</a
        >
        và hiểu
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL"
          >URL là gì</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu tên miền là gì, cách chúng hoạt động và tại sao chúng quan trọng.
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt

Tên miền là một phần quan trọng của cơ sở hạ tầng Internet. Chúng cung cấp địa chỉ dễ đọc cho con người để truy cập bất kỳ máy chủ web nào có trên Internet.

Bất kỳ máy tính nào kết nối Internet đều có thể được tiếp cận qua một {{Glossary("IP Address")}} công khai, hoặc địa chỉ IPv4 (ví dụ: `192.0.2.172`) hoặc địa chỉ IPv6 (ví dụ: `2001:db8:8b73:0000:0000:8a2e:0370:1337`).

Máy tính có thể xử lý các địa chỉ như vậy dễ dàng, nhưng con người gặp khó khăn khi tìm hiểu ai đang chạy máy chủ hoặc dịch vụ nào mà website cung cấp. Địa chỉ IP khó nhớ và có thể thay đổi theo thời gian.

Để giải quyết tất cả những vấn đề đó, chúng ta sử dụng địa chỉ dễ đọc gọi là tên miền.

## Tìm hiểu sâu hơn

### Cấu trúc của tên miền

Tên miền có cấu trúc đơn giản gồm nhiều phần (có thể chỉ một phần, hai, ba…), được phân cách bởi dấu chấm và **đọc từ phải sang trái**:

![Cấu trúc của tên miền MDN](structure.png)

Mỗi phần trong số đó cung cấp thông tin cụ thể về toàn bộ tên miền.

- {{Glossary("TLD")}} (Tên miền cấp cao nhất).
  - : TLD cho người dùng biết mục đích chung của dịch vụ đằng sau tên miền. Các TLD phổ biến nhất (`.com`, `.org`, `.net`) không yêu cầu dịch vụ web phải đáp ứng bất kỳ tiêu chí cụ thể nào, nhưng một số TLD thực thi các chính sách nghiêm ngặt hơn để làm rõ mục đích của chúng. Ví dụ:
    - Các TLD địa phương như `.us`, `.fr`, hoặc `.se` có thể yêu cầu dịch vụ được cung cấp bằng ngôn ngữ nhất định hoặc được lưu trữ ở một quốc gia nhất định — chúng được cho là chỉ ra tài nguyên trong một ngôn ngữ hoặc quốc gia cụ thể.
    - Các TLD chứa `.gov` chỉ được phép sử dụng bởi các cơ quan chính phủ.
    - TLD `.edu` chỉ dành cho các tổ chức giáo dục và học thuật.

    TLD có thể chứa các ký tự đặc biệt cũng như ký tự Latin. Độ dài tối đa của TLD là 63 ký tự, mặc dù hầu hết khoảng 2–3 ký tự.

    Danh sách đầy đủ các TLD được [ICANN duy trì](https://www.icann.org/en/contracted-parties/registry-operators/resources/list-of-top-level-domains).

- Nhãn (hoặc thành phần)
  - : Nhãn là những gì đứng trước TLD. Nhãn là chuỗi ký tự không phân biệt chữ hoa chữ thường từ một đến sáu mươi ba ký tự, chỉ chứa các chữ cái `A` đến `Z`, chữ số `0` đến `9`, và ký tự '-' (không thể là ký tự đầu tiên hoặc cuối cùng trong nhãn). `a`, `97`, và `hello-strange-person-16-how-are-you` đều là ví dụ về nhãn hợp lệ.

    Nhãn nằm ngay trước TLD cũng được gọi là _Tên miền cấp hai_ (SLD).

    Tên miền có thể có nhiều nhãn (hoặc thành phần). Không bắt buộc và không cần thiết phải có 3 nhãn để tạo thành tên miền. Ví dụ, [informatics.ed.ac.uk](https://informatics.ed.ac.uk/) là một tên miền hợp lệ. Đối với bất kỳ tên miền nào bạn kiểm soát (ví dụ: [mozilla.org](https://www.mozilla.org/en-US/)), bạn có thể tạo "tên miền phụ" với nội dung khác nhau tại mỗi tên miền, như [developer.mozilla.org](/), [support.mozilla.org](https://support.mozilla.org/), hoặc [bugzilla.mozilla.org](https://bugzilla.mozilla.org/).

### Mua tên miền

#### Ai sở hữu tên miền?

Bạn không thể "mua tên miền". Điều này là để các tên miền không được sử dụng cuối cùng sẽ có sẵn để người khác sử dụng lại. Nếu mọi tên miền đều được mua, web sẽ nhanh chóng đầy những tên miền không được sử dụng bị khóa và không ai có thể dùng được.

Thay vào đó, bạn trả tiền cho quyền sử dụng tên miền trong một hoặc nhiều năm. Bạn có thể gia hạn quyền của mình, và việc gia hạn của bạn được ưu tiên so với đơn đăng ký của người khác. Nhưng bạn không bao giờ sở hữu tên miền.

Các công ty gọi là nhà đăng ký (registrar) sử dụng các sổ đăng ký tên miền để theo dõi thông tin kỹ thuật và hành chính kết nối bạn với tên miền của mình.

> [!NOTE]
> Đối với một số tên miền, có thể không phải là nhà đăng ký chịu trách nhiệm theo dõi. Ví dụ, mọi tên miền dưới `.fire` được Amazon quản lý.

#### Tìm tên miền khả dụng

Để tìm hiểu xem một tên miền nhất định có khả dụng không,

- Truy cập website của nhà đăng ký tên miền. Hầu hết đều cung cấp dịch vụ "whois" cho biết tên miền có khả dụng không.
- Hoặc, nếu bạn sử dụng hệ thống có shell tích hợp, hãy nhập lệnh `whois` vào đó, như được hiển thị ở đây cho `mozilla.org`:

  ```bash
  whois mozilla.org
  ```

  Kết quả sẽ xuất ra như sau:

  ```plain
  Domain Name:MOZILLA.ORG
  Domain ID: D1409563-LROR
  Creation Date: 1998-01-24T05:00:00Z
  Updated Date: 2013-12-08T01:16:57Z
  Registry Expiry Date: 2015-01-23T05:00:00Z
  Sponsoring Registrar:MarkMonitor Inc. (R37-LROR)
  Sponsoring Registrar IANA ID: 292
  WHOIS Server:
  Referral URL:
  Domain Status: clientDeleteProhibited
  Domain Status: clientTransferProhibited
  Domain Status: clientUpdateProhibited
  Registrant ID:mmr-33684
  Registrant Name:DNS Admin
  Registrant Organization:Mozilla Foundation
  Registrant Street: 650 Castro St Ste 300
  Registrant City:Mountain View
  Registrant State/Province:CA
  Registrant Postal Code:94041
  Registrant Country:US
  Registrant Phone:+1.6509030800
  ```

Như bạn có thể thấy, tôi không thể đăng ký `mozilla.org` vì Mozilla Foundation đã đăng ký nó rồi.

Mặt khác, hãy xem liệu tôi có thể đăng ký `afunkydomainname.org` không:

```bash
whois afunkydomainname.org
```

Kết quả sẽ xuất ra như sau (tại thời điểm viết):

```plain
NOT FOUND
```

Như bạn có thể thấy, tên miền không tồn tại trong cơ sở dữ liệu `whois`, vì vậy chúng ta có thể yêu cầu đăng ký nó. Tốt để biết!

#### Lấy tên miền

Quá trình này khá đơn giản:

1. Truy cập website của nhà đăng ký.
2. Thường có một lời kêu gọi hành động nổi bật "Lấy tên miền". Nhấp vào đó.
3. Điền vào biểu mẫu với tất cả các chi tiết cần thiết. Đặc biệt, hãy đảm bảo rằng bạn không đánh sai tên miền mong muốn. Một khi đã thanh toán, quá muộn để sửa!
4. Nhà đăng ký sẽ cho bạn biết khi tên miền được đăng ký đúng cách. Trong vài giờ, tất cả các máy chủ DNS sẽ nhận được thông tin DNS của bạn.

> [!NOTE]
> Trong quá trình này, nhà đăng ký yêu cầu địa chỉ thực tế của bạn. Hãy điền chính xác, vì ở một số quốc gia, nhà đăng ký có thể bị buộc đóng tên miền nếu họ không thể cung cấp địa chỉ hợp lệ.

#### Làm mới DNS

Cơ sở dữ liệu DNS được lưu trữ trên mọi máy chủ DNS trên toàn thế giới, và tất cả các máy chủ này đều tham chiếu đến một số máy chủ đặc biệt gọi là "máy chủ tên có thẩm quyền" hoặc "máy chủ DNS cấp cao nhất" — đây giống như các máy chủ chủ quản lý hệ thống.

Bất cứ khi nào nhà đăng ký của bạn tạo hoặc cập nhật bất kỳ thông tin nào cho một tên miền nhất định, thông tin phải được làm mới trong mọi cơ sở dữ liệu DNS. Mỗi máy chủ DNS biết về một tên miền nhất định lưu trữ thông tin trong một khoảng thời gian trước khi nó tự động bị vô hiệu hóa và sau đó được làm mới (máy chủ DNS truy vấn máy chủ có thẩm quyền và lấy thông tin cập nhật từ đó). Do đó, mất một khoảng thời gian để các máy chủ DNS biết về tên miền này nhận được thông tin cập nhật nhất.

### Yêu cầu DNS hoạt động như thế nào?

Như chúng ta đã thấy, khi bạn muốn hiển thị một trang web trong trình duyệt, việc gõ tên miền dễ hơn là gõ địa chỉ IP. Hãy xem xét quá trình:

1. Nhập `mozilla.org` vào thanh địa chỉ của trình duyệt.
2. Trình duyệt của bạn hỏi máy tính xem nó đã nhận ra địa chỉ IP được xác định bởi tên miền này chưa (sử dụng bộ nhớ đệm DNS cục bộ). Nếu có, tên được dịch sang địa chỉ IP và trình duyệt thương lượng nội dung với máy chủ web. Kết thúc câu chuyện.
3. Nếu máy tính của bạn không biết IP nào đứng sau tên `mozilla.org`, nó tiếp tục hỏi một máy chủ DNS, công việc của máy chủ này chính xác là cho máy tính của bạn biết địa chỉ IP nào khớp với mỗi tên miền đã đăng ký.
4. Bây giờ máy tính biết địa chỉ IP được yêu cầu, trình duyệt của bạn có thể thương lượng nội dung với máy chủ web.

![Giải thích các bước cần thiết để có kết quả cho yêu cầu DNS](2014-10-dns-request2.png)

## Các bước tiếp theo

Được rồi, chúng ta đã nói rất nhiều về quy trình và kiến trúc. Đã đến lúc tiến lên.

- Nếu bạn muốn thực hành, đây là lúc tốt để bắt đầu nghiên cứu thiết kế và khám phá [cấu trúc của một trang web](/en-US/docs/Learn_web_development/Howto/Design_and_accessibility/Common_web_layouts).
- Cũng đáng chú ý là một số khía cạnh của việc xây dựng website tốn tiền. Vui lòng tham khảo [chi phí xây dựng website là bao nhiêu](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/How_much_does_it_cost).
- Hoặc đọc thêm về [Tên miền](https://en.wikipedia.org/wiki/Domain_name) trên Wikipedia.
- Hướng dẫn [DNS hoạt động như thế nào](https://howdns.works/) có giải thích vui và đầy màu sắc.
