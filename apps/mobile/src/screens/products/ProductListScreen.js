import React from 'react';
import {View, Text, StyleSheet, FlatList} from 'react-native';

const ProductListScreen = () => {
  const products = []; // Products will come from Redux store

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Ürünler</Text>
      <FlatList
        data={products}
        keyExtractor={(item) => item.id?.toString()}
        renderItem={({item}) => (
          <View style={styles.productItem}>
            <Text style={styles.productName}>{item.name}</Text>
          </View>
        )}
        ListEmptyComponent={
          <View style={styles.emptyContainer}>
            <Text style={styles.emptyText}>Henüz ürün yok</Text>
          </View>
        }
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    padding: 20,
    backgroundColor: '#fff',
  },
  productItem: {
    backgroundColor: '#fff',
    padding: 15,
    marginVertical: 5,
    marginHorizontal: 10,
    borderRadius: 8,
  },
  productName: {
    fontSize: 16,
    color: '#333',
  },
  emptyContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 40,
  },
  emptyText: {
    fontSize: 16,
    color: '#999',
  },
});

export default ProductListScreen;
