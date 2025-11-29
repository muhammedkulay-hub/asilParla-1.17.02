import React from 'react';
import {View, Text, StyleSheet, ScrollView} from 'react-native';
import {Card} from '../../components/common/Card';

const HomeScreen = () => {
  return (
    <ScrollView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.title}>AsilParla</Text>
        <Text style={styles.subtitle}>Hoş Geldiniz</Text>
      </View>
      <Card>
        <Text style={styles.cardTitle}>Dashboard</Text>
        <Text style={styles.cardText}>Ana ekran içeriği buraya gelecek</Text>
      </Card>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  header: {
    padding: 20,
    backgroundColor: '#fff',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#333',
  },
  subtitle: {
    fontSize: 16,
    color: '#666',
    marginTop: 5,
  },
  cardTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  cardText: {
    fontSize: 14,
    color: '#666',
  },
});

export default HomeScreen;
