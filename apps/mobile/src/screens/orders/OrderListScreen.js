import React from 'react';
import {View, Text, StyleSheet, FlatList} from 'react-native';

const OrderListScreen = () => {
  const orders = []; // Orders will come from Redux store

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Siparişler</Text>
      <FlatList
        data={orders}
        keyExtractor={(item) => item.id?.toString()}
        renderItem={({item}) => (
          <View style={styles.orderItem}>
            <Text style={styles.orderId}>Sipariş #{item.id}</Text>
          </View>
        )}
        ListEmptyComponent={
          <View style={styles.emptyContainer}>
            <Text style={styles.emptyText}>Henüz sipariş yok</Text>
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
  orderItem: {
    backgroundColor: '#fff',
    padding: 15,
    marginVertical: 5,
    marginHorizontal: 10,
    borderRadius: 8,
  },
  orderId: {
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

export default OrderListScreen;
