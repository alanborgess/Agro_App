import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lojas Agropecuárias',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LojaPage(),
    );
  }
}

class LojaPage extends StatelessWidget {
  final List<Store> stores = [
    Store(
      name: 'Loja Agropecuária',
      imageUrl: 'https://io.convertiez.com.br/m/lojaagropecuaria/uploads/novo_layout_2022/full_banners/junho_2023/loja-agropecuaria_banner_site_-entre-em-contato.png',
      subtitle: 'A Loja Agropecuária foi lançada em 2010 para atender às necessidades de clientes em todo o Brasil',
      websiteUrl: 'https://www.lojaagropecuaria.com.br',
    ),
    Store(
      name: 'DuAgro',
      imageUrl: 'https://images.tcdn.com.br/img/img_prod/1103037/1684589089_home_tema_novo.png',
      subtitle: 'Com o intuito de ser parceira do produtor, tanto em tecnologias agrícolas como em alimentação animal.',
      websiteUrl: 'https://www.lojaduagro.com.br/',
    ),
    Store(
      name: 'Casa da Lavoura',
      imageUrl: 'https://casadalavoura.vteximg.com.br/arquivos/ids/158999/Intermedi%C3%A1rio%20%20-%20PIX%20(1).png?v=637975718859400000',
      subtitle: 'Com objetivo de alimentar o mundo, o grupo busca aumento da produtividade e da riqueza dos produtores e propriedades rurais.',
      websiteUrl: 'https://www.clavoura.com.br/',
    ),
    Store(
      name: 'Agro Bovino',
      imageUrl: 'https://d3ugyf2ht6aenh.cloudfront.net/stores/934/592/themes/amazonas/1-slide-1678375320830-6991850161-860a427b7eb2394d68b7e3265ede1fdb1678375737-1920-1920.webp?360169416',
      subtitle: 'Você encontrará uma seleção cuidadosa de copos térmicos, facas, canivetes, produtos para tereré, bonés, chaveiros, produtos Stanley, garrafas térmicas e muito mais. ',
      websiteUrl: 'https://lojaagrobovino.com/',
    ),
    Store(
      name: 'Agro e Jardim',
      imageUrl: 'https://images.tcdn.com.br/img/img_prod/1078944/1663612323_full-banner-desktop-coupon.jpg',
      subtitle: ' Agro e Jardim oferece ferramentas motorizadas e assistência técnica voltada para o mercado agrícola e de jardinagem. ',
      websiteUrl: 'https://www.agroejardim.com.br/',
    ),
    Store(
      name: 'BASF Agro',
      imageUrl: 'https://images.tcdn.com.br/img/img_prod/1078944/1641935387_agro-e-jardim-desktop-mini-banner-06.png',
      subtitle: 'As tecnologias mais modernas do mercado e a expertise BASF',
      websiteUrl: 'https://lojaagro.basf.com/aps/s/',
    ),
    Store(
      name: 'Olim Agro',
      imageUrl: 'https://images.tcdn.com.br/img/img_prod/808621/1688152700_banner-1.jpg',
      subtitle: 'Tem como atividades principais o beneficiamento de arroz e o Comércio Atacadista de Insumos Agrícolas, atuando nestes mercados há mais de 50 anos',
      websiteUrl: 'https://www.olim.com.br/',
    ),
    Store(
      name: 'Loja do Agro',
      imageUrl: 'https://d3ugyf2ht6aenh.cloudfront.net/stores/002/690/878/themes/amazonas/1-slide-1677780158269-8407516509-6b47aba4ad43966c3bdc55aa1f1c14ba1677780559-1920-1920.webp?321736414',
      subtitle: 'Loja do Agro é uma loja virtual que comercializa produtos para a agricultura atual. ',
      websiteUrl: 'https://www.lojadoagro.com.br/',
    ),
    // Adicione mais lojas aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lojas Agropecuárias'),
        backgroundColor: Colors.green,    
      ),
      body: Container(
        color: Colors.green[100],
        padding: EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.1, // Relação de aspecto para ajustar a largura e altura do card
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          children: stores.map((store) {
            return InkWell(
              onTap: () {
                _launchURL(store.websiteUrl);
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        store.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            store.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            store.subtitle,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Store {
  final String name;
  final String imageUrl;
  final String subtitle;
  final String websiteUrl;

  Store({
    required this.name,
    required this.imageUrl,
    required this.subtitle,
    required this.websiteUrl,
  });
}
