import { Clarinet, Tx, Chain, Account, types } from 'https://deno.land/x/clarinet@v1.0.0/index.ts';
import { assertEquals } from 'https://deno.land/std@0.90.0/testing/asserts.ts';

Clarinet.test({
  name: "Ensure that NFT minting works",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    const deployer = accounts.get('deployer')!;
    const wallet1 = accounts.get('wallet_1')!;
    
    let block = chain.mineBlock([
      Tx.contractCall('zen-nft', 'mint', 
        [types.principal(wallet1.address),
         types.ascii("First Achievement"),
         types.ascii("Completed first meditation")], 
        deployer.address)
    ]);
    assertEquals(block.receipts[0].result, '(ok u1)');
  },
});
